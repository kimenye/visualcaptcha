# Deprecated

This gem is deprecated. Please use [emotionLoop's official ruby gem](https://github.com/emotionLoop/visualCaptcha-rubyGem).

## Visualcaptcha

This Gem is ruby version of emotionLoop's PHP Visual Captcha

## Installation

Add this line to your application's Gemfile:

    gem 'visualcaptcha'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install visualcaptcha

## Setup

After installation, follow these simple steps to setup the plugin. The setup will depend on the version of rails your application is using.

    $ rails generate visual_captcha

This project requires jquery-ui so you should add it to the application.js

    //= require jquery.ui.all

## Usage

###Controller Based

We have only enabled a controller based flow at the moment - as this is the simplest use case required

In the view file within the form tags add this code

    <%= show_visual_captcha(:type => :vertical) %>

Add the following line in the file "app/controllers/application.rb"

    ApplicationController < ActionController::Base
        include VisualCaptcha::ControllerHelpers
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
