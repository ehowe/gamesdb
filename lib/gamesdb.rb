require 'gamesdb/version'

require 'excon'
require 'nokogiri'
require 'cistern'
require 'rest-client'

module Gamesdb
  autoload :Client, 'gamesdb/client'
  autoload :SaxDocument, 'gamesdb/saxdocument'

end
