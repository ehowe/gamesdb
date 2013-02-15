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

  def path_url
    "http://thegamesdb.net/banners/_gameviewcache/"
  end

  def append_urls(resource)
    resource = resource.class == Array ? resource : [resource]
    if resource.first.is_a?(Hash)
      resource.map! { |h| h.each { |k,v| h[k] = path_url + v } }
    else
      resource.map! { |url| path_url + url }
    end
    resource
  end

  def fanart
    requires :images
    append_urls images["fanart"]
  end

  def boxart
    requires :images
    append_urls images["boxart"]
  end

  def banner
    requires :images
    append_urls images["banner"]
  end

  def screenshot
    requires :images
    append_urls images["screenshot"]
  end

  def clearlogo
    requires :images
    append_urls images["clearlogo"]
  end
end
