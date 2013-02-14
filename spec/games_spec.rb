require 'spec_helper'

describe "Gamesdb::Games" do
  let(:client) { create_client }
  it "should have games" do
    games = client.games.search('x-men')
    games.should_not be_empty
    games.first.should be_a_kind_of(Gamesdb::Client::Game)
  end

  it "should get a game" do
    game = client.games.get(15)
    game.should_not be_nil
    game.should be_a_kind_of(Gamesdb::Client::Game)
  end
end
