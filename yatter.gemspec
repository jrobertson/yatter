Gem::Specification.new do |s|
  s.name = 'yatter'
  s.version = '0.2.0'
  s.summary = 'Yet another Twitter wrapper'
  s.authors = ['James Robertson']
  s.files = Dir['lib/yatter.rb']
  s.add_runtime_dependency('twitter', '~> 5.15', '>=5.15.0')
  s.add_runtime_dependency('dynarex-password', '~> 0.1', '>=0.1.11')
  s.add_runtime_dependency('xml-registry', '~> 0.3', '>=0.3.1')
  s.signing_key = '../privatekeys/yatter.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/yatter'
end
