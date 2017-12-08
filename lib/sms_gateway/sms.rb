## The SMS-Object
module SmsGateway
  class Sms < Struct.new(:number, :message, :device)
    def initialize(params)
      self.number   = params[:number]
      self.message  = params[:message]
      self.device   = params[:device]
    end

    def deliver
      SmsGateway::Base.deliver(self)
    end

    def to_s
      "SMS: Device#{device}, to:#{number}, message:#{message}"
    end
  end
end
