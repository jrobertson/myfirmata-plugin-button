Gem::Specification.new do |s|
  s.name = 'myfirmata-plugin-button'
  s.version = '0.1.2'
  s.summary = 'A MyFirmata plugin which detects a button press and publishes a message to the SimplePubSub broker.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/myfirmata-plugin-button.rb']
  s.signing_key = '../privatekeys/myfirmata-plugin-button.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/myfirmata-plugin-button'
end
