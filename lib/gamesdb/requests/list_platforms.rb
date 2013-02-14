class Gamesdb::Client
  class Real
    def list_platforms
      request(
        :path => "/GetPlatformsList.php"
      )
    end
  end

  class Mock
    def list_games
      YAML.load_file(File.expand_path("../../seeds/platforms.yaml", __FILE__))
    end
  end
end
