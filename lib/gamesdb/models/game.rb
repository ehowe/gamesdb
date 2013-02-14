class Gamesdb::Client::Game < Cistern::Model
  identity :id

  attribute :game_title,   aliases: "GameTitle"
  attribute :release_date, aliases: "ReleaseDate"
  attribute :platform,     aliases: "Platform"
  attribute :overview,     aliases: "Overview"
  attribute :esrb,         aliases: "ESRB"
  attribute :genres,       aliases: "Genres",      squash: "genre"
  attribute :players,      aliases: "Players"
  attribute :coop,         aliases: "Co-op"
  attribute :youtube,      aliases: "Youtube"
  attribute :publisher,    aliases: "Publisher"
  attribute :developer,    aliases: "Developer"
  attribute :rating,       aliases: "Rating"
  attribute :fanart,                               squash: "Images",  type: Array
  attribute :boxart,                               squash: "Images",  type: Array
  attribute :banner,                               squash: "Images",  type: Array
  attribute :screenshot,                           squash: "Images",  type: Array
  attribute :thumb,                                squash: "Images",  type: Array
  attribute :clearlogo,                            squash: "Images",  type: Array
end
