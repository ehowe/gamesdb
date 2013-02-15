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
  attribute :images,       aliases: "Images"
  #attribute :fanart,       aliases: "Images",      squash: "fanart"
  #attribute :boxart,       aliases: "Images",      squash: "boxart"
  #attribute :banner,       aliases: "Images",      squash: "banner"
  #attribute :screenshot,   aliases: "Images",      squash: "screenshot"
  #attribute :thumb,        aliases: "Images",      squash: "thumb"
  #attribute :clearlogo,    aliases: "Images",      squash: "clearlogo"

  def fanart
    requires :images
    images["fanart"]
  end

  def boxart
    requires :images
    images["boxart"]
  end

  def banner
    requires :images
    images["banner"]
  end

  def screenshot
    requires :images
    images["screenshot"]
  end

  def thumb
    requires :images
    images["thumb"]
  end

  def clearlogo
    requires :images
    images["clearlogo"]
  end
end
