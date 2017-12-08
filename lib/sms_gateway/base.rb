module SmsGateway
  class Base
    class << self
      attr_accessor :password, :base_uri, :email, :device, :number
      attr_reader :adapter

      def configure
        yield(self)
      end

      def adapter=(underscore_name)
        klassname = underscore_name.split('_').map(&:capitalize).join
        klass = SmsGateway::Adapters.const_get(klassname)
        @adapter = klass.new
      end

      attr_reader :config

      def config=(options)
        @config = options
        adapter = @config.delete(:adapter)
        @config.each do |k, v|
          send "#{k}=", v
        end
        self.adapter = adapter
      end

      def deliver(sms)
        adapter.send_sms(sms)
      end

      def self.deliver_later(message, number, device = Base.config[:from])
        Resque.enqueue(SmsGateway::Workers::SmsJob, text, to, from)
      end
    end
  end
end
