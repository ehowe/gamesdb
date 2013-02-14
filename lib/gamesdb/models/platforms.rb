class Gamesdb::Client::Platforms < Cistern::Collection

  model Gamesdb::Client::Platform

  def all
    if data = self.connection.list_platforms["Platforms"]["Platform"]
      self.clone.load(data)
    end
  end

  def get(id)
    if data = self.connection.get_platform(id)["Platform"]
      self.clone.new(data)
    end
  end
end
