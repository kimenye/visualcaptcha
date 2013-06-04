module VisualCaptcha
  module ViewHelper

    def show_visual_captcha(options = {})
      render :partial => 'visual_captcha/visual_captcha'
    end
  end
end