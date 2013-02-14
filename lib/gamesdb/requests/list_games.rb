class Gamesdb::Client
  class Real
    def list_games(search)
      request(
        :path => "/GetGamesList.php",
        :query => {"name" => search},
      )
    end
  end

  class Mock
    def list_games(search)
      YAML.load_file(File.expand_path("../../seeds/games.yaml", __FILE__))
    end
  end
end
