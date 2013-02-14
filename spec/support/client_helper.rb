module ClientHelper
  def create_client
    Gamesdb::Client.new
  end
end

RSpec.configure do |config|
  config.include(ClientHelper)
end
