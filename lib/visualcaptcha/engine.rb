require 'rails'
require 'visualcaptcha'

module VisualCaptcha
  class Engine < ::Rails::Engine
    config.after_initialize do
      ActionView::Base.send(:include, VisualCaptcha::ViewHelper)
    end
  end
end