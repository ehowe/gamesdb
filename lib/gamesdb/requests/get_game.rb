class Gamesdb::Client
  class Real
    def get_game(id)
      request(
        :path => "/GetGame.php",
        :query => {"id" => id}
      )
    end
  end

  class Mock
    def get_game(id)
      YAML.load_file(File.expand_path("../../seeds/games.yaml", __FILE__))
    end
  end
end
