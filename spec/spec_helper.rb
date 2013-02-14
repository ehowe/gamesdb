ENV['MOCK_GAMES'] ||= "false"

Bundler.require(:test)

require File.expand_path('../../lib/gamesdb', __FILE__)

Dir[File.expand_path('../{support,matchers}/*.rb', __FILE__)].each { |f| require(f) }

if ENV['MOCK_GAMES'] == "true"
  Gamesdb::Client.mock!
end

RSpec.configure do |config|
  config.before(:all) do
    Gamesdb::Client.reset! if Gamesdb::Client.mocking?
  end
end
