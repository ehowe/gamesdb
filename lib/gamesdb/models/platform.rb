class Gamesdb::Client::Platform < Cistern::Model
  identity :id

  attribute :name
  attribute :alias
  attribute :console
  attribute :controller
  attribute :overview
  attribute :developer
  attribute :manufacturer
  attribute :cpu
  attribute :memory
  attribute :graphics
  attribute :sound
  attribute :display
  attribute :media
  attribute :maxcontrollers
  attribute :rating,         aliases: "Rating"
  attribute :images,         aliases: "Images"
  #attribute :fanart,         aliases: "Images", squash: "fanart",        type: Array
  #attribute :boxart,         aliases: "Images", squash: "boxart",        type: Array
  #attribute :banner,         aliases: "Images", squash: "banner",        type: Array
  #attribute :consoleart,     aliases: "Images", squash: "consoleart",    type: Array
  #attribute :controllerart,  aliases: "Images", squash: "controllerart", type: Array

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

  def games
    data = connection.get_platform_games(identity)["Game"]
    connection.games.load(data)
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

  def consoleart
    requires :images
    append_urls images["consoleart"]
  end

  def controllerart
    requires :images
    append_urls images["controllerart"]
  end
end
