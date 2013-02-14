class Gamesdb::Client::Game < Cistern::Model
  identity :id

  attribute :game_title,   aliases: "GameTitle"
  attribute :release_data, aliases: "ReleaseDate"
  attribute :platform,     aliases: "Platform"
end
