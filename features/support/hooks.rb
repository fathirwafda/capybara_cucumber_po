# frozen_string_literal: true

Before do
  @logger = Logger.new(STDOUT)
end

AfterStep do
  unless @api
    begin
      url = URI.parse(current_url)
      puts url
    rescue StandardError
      nil
    end
  end
end
