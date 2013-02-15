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
  attribute :fanart,         aliases: "Images", squash: "fanart",        type: Array
  attribute :boxart,         aliases: "Images", squash: "boxart",        type: Array
  attribute :banner,         aliases: "Images", squash: "banner",        type: Array
  attribute :consoleart,     aliases: "Images", squash: "consoleart",    type: Array
  attribute :controllerart,  aliases: "Images", squash: "controllerart", type: Array

  def games
    data = connection.get_platform_games(identity)["Game"]
    connection.games.load(data)
  end
end
