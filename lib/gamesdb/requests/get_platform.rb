class Gamesdb::Client
  class Real
    def get_platform(id)
      request(
        :path => "/GetPlatform.php",
        :query => {"id" => id}
      )
    end
  end

  class Mock
    def get_platform
      YAML.load_file(File.expand_path("../../seeds/platforms.yaml", __FILE__))
    end
  end
end
