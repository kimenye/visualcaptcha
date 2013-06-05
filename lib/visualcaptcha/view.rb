module VisualCaptcha
  module ViewHelper

    def show_visual_captcha(options = {})
      if options[:type] == :vertical
        options[:type] = "type-1"
      else
        options[:type] = "type-2"
      end

      options[:clue] = "umberella"

      render :partial => 'visual_captcha/visual_captcha', :locals => { :captcha_options =>  options }
    end
  end
end