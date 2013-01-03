$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'color_fun'

Gem::Specification.new do |s|
  s.name = 'color_fun'
  s.version = ColorFun::VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = "A little gem for playing with colors in Ruby"
  s.description = s.summary
  s.files = Dir["**/*"]
  s.bindir = "bin"
  s.require_path = 'lib'
  s.has_rdoc = false
  s.author = "Adam Cooke"
  s.email = "adam@atechmedia.com"
  s.homepage = "http://atechmedia.com"
end
