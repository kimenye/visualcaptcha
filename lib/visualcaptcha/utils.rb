require 'digest/sha1'

module VisualCaptcha #:nodoc
  module Utils #:nodoc
    def self.generate_key(*args)
      args << Time.now.to_s
      Digest::SHA1.hexdigest(args.join)
    end
  end
end

