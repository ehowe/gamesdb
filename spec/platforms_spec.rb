require 'spec_helper'

describe "Gamesdb::Platforms" do
  let(:client) { create_client }
  it "should have platforms" do
    platforms = client.platforms.all
    platforms.should_not be_empty
    platforms.first.should be_a_kind_of(Gamesdb::Client::Platform)
  end

  it "should get a platform" do
    platform = client.platforms.get(15)
    platform.should_not be_nil
    platform.should be_a_kind_of(Gamesdb::Client::Platform)
  end

  it "should have platform games" do
    platform = client.platforms.get(15)
    platform.games.should_not be_nil
    platform.games.first.should be_a_kind_of(Gamesdb::Client::Game)
  end
end
