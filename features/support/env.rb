$LOAD_PATH.unshift File.expand_path('../../object_abstractions/web', __FILE__)

require "capybara/cucumber"
require "capybara-screenshot/cucumber"
require "capybara/rspec"
require 'faker'
require "selenium-webdriver"
require "rspec/retry"
require "pry"
require "securerandom"
require "yaml"
require "dotenv"
require "site_prism"
require "httparty"
require "uri"
require "net/http"
require "headless"
require "nokogiri"
require "open-uri"
require "filesize"
require "fileutils"
require "net/http/post/multipart"
require "logger"
require "uri"
require "net/ssh"
require 'logger'
require 'webdrivers'
require 'rotp'
require 'json'
require 'jwt'

Dotenv.load

def close_capybara_session
  Capybara.current_session.driver.quit
end

Before('@video') do
  Dir.glob("#{Dir.pwd}/video/*.mov").each { |file| File.delete(file) }
  @video = true
  executor_number = ENV['EXECUTOR_NUMBER'] ? 600 + ENV['EXECUTOR_NUMBER'].to_i : 99
  puts "Executor Number = #{executor_number}"
  @headless = Headless.new(dimensions: '1366x768x24', display: executor_number,
                           video: { provider: 'ffmpeg' })
  @headless.start
  @headless.video.start_capture
end

After("@video") do |scenario|
  if scenario.failed?
    dir_path = "#{Dir.pwd}/video/#{scenario.name.split.join("_")}.mov"
    puts "Video save to #{dir_path}"
    @headless.video.stop_and_save(dir_path)
    
  else
    @headless.video.stop_and_discard
  end
end
