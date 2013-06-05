require "visualcaptcha/version"
require "visualcaptcha/engine"

module VisualCaptcha
  autoload :ViewHelper, 'visualcaptcha/view'

  def self.setup
    yield self
  end

  class Captcha

  end
end
