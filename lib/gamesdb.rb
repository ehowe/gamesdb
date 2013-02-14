require 'gamesdb/version'

require 'excon'
require 'nokogiri'
require 'cistern'
require 'rest-client'
require 'awesome_print'

Cistern.formatter = Cistern::Formatter::AwesomePrint

module Gamesdb
  autoload :Client, 'gamesdb/client'
  autoload :SaxDocument, 'gamesdb/saxdocument'

end
