# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gamesdb/version'

Gem::Specification.new do |gem|
  gem.name     = "gamesdb"
  gem.version  = Gamesdb::Version
  gem.authors  = ["Eugene Howe"]
  gem.email    = "eugene@xtreme-computers.net"
  gem.homepage = "https://github.com/ehowe/gamesdb.git"

  gem.files    = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  gem.add_dependency 'cistern'
  gem.add_dependency 'excon'
  gem.add_dependency 'nokogiri'
  gem.add_dependency 'rest-client'
end
