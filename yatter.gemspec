Gem::Specification.new do |s|
  s.name = 'yatter'
  s.version = '0.4.0'
  s.summary = 'Yet another Twitter wrapper'
  s.authors = ['James Robertson']
  s.files = Dir['lib/yatter.rb']
  s.add_runtime_dependency('twitter', '~> 7.0', '>=7.0.0')
  s.add_runtime_dependency('dynarex-password', '~> 0.2', '>=0.2.0')
  s.add_runtime_dependency('remote_dwsregistry', '~> 0.4', '>=0.4.1')
  s.signing_key = '../privatekeys/yatter.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/yatter'
end
