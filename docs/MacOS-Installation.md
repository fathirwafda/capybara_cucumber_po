## How to Setup (Mac)

1. Install [Homebrew](https://brew.sh/)

  ```bash
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

2. Install [RVM](https://rvm.io/)

  ```bash
  curl -L get.rvm.io | bash -s stable
  source ~/.bash_profile
  ```

  Then run `rvm requirements` and follow the instructions

3. Install Ruby 2.5.5

  ```bash
  rvm install 2.5.5
  ```

4. Install Dependencies

  * Install [XQuartz](https://www.xquartz.org)
  * Configure display socket lock file (unfortunately this had to be run every time you restart your laptop, alternatives are listed below)

  ```bash
  mkdir /tmp/.X11-unix
  sudo chmod 1777 /tmp/.X11-unix
  sudo chown root /tmp/.X11-unix/
  ```

  * Install libav/avconv

  ```bash
  brew install libav
  ```

  * Install CMake

  ```bash
  brew install cmake pkg-config && sudo ln -s /usr/local/bin/make /usr/local/bin/gmake
  ```

  * Install mysql
  ```bash
  brew install mysql
  ```

5. Install Git

  ```bash
  brew install git
  ```

6. Configure Git

  ```bash
  git config --global user.name "Your Name Here"
  git config --global user.email "your-github-email@example.com"
  ```

7. Generate Public Key

  ```bash
  ssh-keygen # then, just press enter
  ```

8. Add key to Github

  ```bash
  cat ~/.ssh/id_rsa.pub # copy the content to github
  ```

9. Clone the project

  ```bash
  git clone git@github.com:fathirwafda/capybara_cucumber_po.git
  cd capybara_cucumber_po
  ```

10. Copy .env file

  ```bash
  cp env.sample .env
  ```

11. Install [bundler](http://bundler.io/)

  ```bash
  gem install bundler
  ```

12. Run bundle install

  ```bash
  bundle install # or `bundle` for simpler command
  ```

13. Enable hooks settings

  ```bash
  git config core.hooksPath .githooks
  ```

14. Installing Firefox ESR

  * Download firefox esr [here](https://download.mozilla.org/?product=firefox-60.0.1esr-SSL&os=osx&lang=en-US)

  run and add it into application

15. Go back to capybara_cucumber_po folder and run cucumber to make sure everything is installed

   ```bash
    bundle exec cucumber -p web-desktop --tag @interview-test
   ```

16. If yout got `ffmpeg not found on your system. Install it or change video recorder provider (Headless::Exception)` . install ffmpeg

  ```bash
    brew install ffmpeg
  ```

## XQuartz Setup

For using `@video` tag, macOS must trigger XQuartz. Basically it can be manually done by creating `/tmp/.X11-unix` folder, change its mode to 777, and change its owner to root. Unfortunately, macOS will clear `/tmp` folder each time the laptop is restarted. Here are some alternatives:

* Manually run these commands after restart

  ```bash
  mkdir /tmp/.X11-unix
  sudo chmod 1777 /tmp/.X11-unix
  sudo chown root /tmp/.X11-unix/
  ```

* Add XQuartz as Login Items

  1. Open `System Preferences`
  2. Open `Users & Groups`
  3. Pick your user at the sidebar (default to current user logged in)
  4. Open `Login Items` tab
  5. Click `+` button
  6. Find XQuartz in `Application/Utilities/XQuartz`
  7. Click `Add` button

  Cons: it will open XQuartz terminal every time you log in, you may close it after

## Common Errors

* JSON 1.8.5 error when running `bundle`, update your XCode or run `xcode-select --install`
