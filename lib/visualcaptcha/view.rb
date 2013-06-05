module VisualCaptcha
  module ViewHelper

    def show_visual_captcha(options = {})
      options = sanitize_options(options)

      #key = visual_captcha_key('captcha')

      captcha = VisualCaptcha::Captcha.new
      challenge = captcha.build

      render :partial => 'visual_captcha/visual_captcha', :locals => { :captcha_options =>  options, :challenge => challenge }
    end

    private

      def sanitize_options(options)
        if options[:type] == :vertical
          options[:type] = "type-1"
        else
          options[:type] = "type-2"
        end
        options
      end

      def visual_captcha_key(key_name = nil)
        if key_name.nil?
          session[:captcha] ||= VisualCaptcha::Utils.generate_key(session[:id].to_s, 'captcha')
        else
          VisualCaptcha::Utils.generate_key(session[:id].to_s, key_name)
        end
      end
  end
end