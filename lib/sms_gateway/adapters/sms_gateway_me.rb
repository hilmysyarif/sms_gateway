module SmsGateway
  module Adapters
    class SmsGatewayMe

      require 'httparty'
      include HTTParty
      base_uri 'https://smsgateway.me'

      def initialize(config = {})
        @config = { email: SmsGateway::Base.email, password: SmsGateway::Base.password, device: SmsGateway::Base.device }
        @config.merge!(config)
        self.class.base_uri SmsGateway::Base.base_uri
      end

      def send_sms(sms)
        options = @config.merge(number: sms.number, message: sms.message, device: sms.device)
        self.class.post('/api/v3/messages/send', query: options)
      end
    end
  end
end
