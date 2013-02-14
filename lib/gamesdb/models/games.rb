class Gamesdb::Client::Games < Cistern::Collection

  model Gamesdb::Client::Game

  def search(name)
    if data = self.connection.list_games(name)["Game"]
      self.clone.load(data)
    end
  end

  def get(id)
    if data = self.connection.get_game(id)["Game"]
      self.clone.new(data)
    end
  end
end
