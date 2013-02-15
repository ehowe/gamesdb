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
  attribute :fanart,       aliases: "Images",      squash: "fanart",     type: Array
  attribute :boxart,       aliases: "Images",      squash: "boxart",     type: Array
  attribute :banner,       aliases: "Images",      squash: "banner",     type: Array
  attribute :screenshot,   aliases: "Images",      squash: "screenshot", type: Array
  attribute :thumb,        aliases: "Images",      squash: "thumb",      type: Array
  attribute :clearlogo,    aliases: "Images",      squash: "clearlogo",  type: Array
end
