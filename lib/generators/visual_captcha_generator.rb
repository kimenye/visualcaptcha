require 'rails/generators'

class VisualCaptchaGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates/'))
  end

  def create_partial
    template "partial.erb", File.join('app/views', 'visual_captcha', "_visual_captcha.erb")
  end
end
