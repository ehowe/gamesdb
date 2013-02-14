class Gamesdb::Client
  class Real
    def get_platform_games(id)
      request(
        :path => "/GetPlatformGames.php",
        :query => {"platform" => id}
      )
    end
  end

  class Mock
    def get_platform_games(id)
      games = YAML.load_file(File.expand_path("../../seeds/games.yaml", __FILE__))["Game"]
    end
  end
end
