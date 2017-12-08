# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'sms_gateway/version'

Gem::Specification.new do |s|
  s.name        = 'sms_gateway'
  s.version     = SmsGateway::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Hilmy Syarif']
  s.email       = ['hilmysyarif@gmail.com']
  s.homepage    = ''
  s.summary     = 'Simple and flexible interface to SMS Gateways'
  s.description = 'Provides an interface to SMS Gateways. So far it supports smsgateway.me'

  s.rubyforge_project = 'sms_gateway'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency('httparty')

  s.add_development_dependency('rake')
  s.add_development_dependency('minitest')
  s.add_development_dependency('pry')
  s.add_development_dependency('webmock')
end
