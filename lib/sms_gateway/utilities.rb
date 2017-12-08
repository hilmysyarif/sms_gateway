module SmsGateway
  module Utilities
    extend self

    def install(verbose=true)
      if File.exist?(Rails.application.root + 'config/initializers/setup_sms_gateway.rb')
        puts "already exists: config/initializers/setup_sms_gateway.rb, file not copied" if verbose
      else
        path = File.expand_path('generators/install/templates', __dir__)
        FileUtils.cp(path + '/initializer.rb',
          Rails.application.root + 'config/initializers/setup_sms_gateway.rb')
        puts "created: config/sinitializers/setup_sms_gateway.rb" if verbose
      end

      if File.exist?(Rails.application.root + 'config/sms_gateway.yml')
        puts "already exists: config/initializers/sms_gateway.yml, file not copied" if verbose
      else
        path = File.expand_path('generators/install/templates', __dir__)
        FileUtils.cp(path + '/setup.yml',
          Rails.application.root + 'config/sms_gateway.yml')
        puts "created: config/sms_gateway.yml" if verbose
      end
    end
  end
end
