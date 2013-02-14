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
  attribute :fanart,                            squash: "Images", type: Array
  attribute :boxart,                            squash: "Images", type: Array
  attribute :banner,                            squash: "Images", type: Array
  attribute :consoleart,                        squash: "Images", type: Array
  attribute :controllerart,                     squash: "Images", type: Array

  def games
    data = connection.get_platform_games(identity)["Game"]
    connection.games.load(data)
  end
end
