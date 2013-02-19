gamesdb
=======

Quick Gem for dealing with thegamesdb.net API

## Usage

```ruby
client = Gamesdb::Client.new
games = client.games.search("halo")
  =>
  Gamesdb::Client::Games [
    [ 0] #<Gamesdb::Client::Game:0x00000000cfa940> {
                  :id => "9",
          :game_title => "Halo 2",
        :release_date => "05/31/2007",
            :platform => "PC"
    },
    [ 1] #<Gamesdb::Client::Game:0x00000000d0cb40> {
                  :id => "90",
          :game_title => "Halo 3",
        :release_date => "09/25/2007",
            :platform => "Microsoft Xbox 360"
    },
    [ 2] #<Gamesdb::Client::Game:0x00000000d112a8> {
                  :id => "638",
          :game_title => "Halo: Reach",
        :release_date => "09/14/2010",
            :platform => "Microsoft Xbox 360"
    },
    [ 3] #<Gamesdb::Client::Game:0x00000000d14ac0> {
                  :id => "847",
          :game_title => "Halo Wars",
        :release_date => "03/03/2009",
            :platform => "Microsoft Xbox 360"
    },
    [ 4] #<Gamesdb::Client::Game:0x00000000d375c0> {
                  :id => "3597",
          :game_title => "Halo 4",
        :release_date => "11/06/2012",
            :platform => "Microsoft Xbox 360"
    },
    [ 5] #<Gamesdb::Client::Game:0x00000000d3ffe0> {
                  :id => "6079",
          :game_title => "Halo 2",
        :release_date => "11/09/2004",
            :platform => "Microsoft Xbox"
    },
    [ 6] #<Gamesdb::Client::Game:0x00000000d49950> {
                  :id => "1",
          :game_title => "Halo: Combat Evolved",
        :release_date => "11/15/2001",
            :platform => "PC"
    },
    [ 7] #<Gamesdb::Client::Game:0x00000000d46408> {
                  :id => "193",
          :game_title => "Halo 3: ODST",
        :release_date => "09/22/2009",
            :platform => "Microsoft Xbox 360"
    },
    [ 8] #<Gamesdb::Client::Game:0x00000000d5ccf8> {
                  :id => "3996",
          :game_title => "Halo: Combat Evolved",
        :release_date => "11/15/2001",
            :platform => "Microsoft Xbox"
    },
    [ 9] #<Gamesdb::Client::Game:0x00000000d8c2f0> {
                  :id => "14558",
          :game_title => "Halo 4 Limited Edition",
        :release_date => "11/06/2012",
            :platform => "Microsoft Xbox 360"
    },
    [10] #<Gamesdb::Client::Game:0x00000000dab448> {
                  :id => "12743",
          :game_title => "Halo: Combat Evolved Anniversary",
        :release_date => "11/15/2011",
            :platform => "Microsoft Xbox 360"
    },
    [11] #<Gamesdb::Client::Game:0x00000000dba470> {
                  :id => "14577",
          :game_title => "Halo 3 Limited Edition",
        :release_date => "09/25/2007",
            :platform => "Microsoft Xbox 360"
    },
    [12] #<Gamesdb::Client::Game:0x00000000dc1ab8> {
                  :id => "14578",
          :game_title => "Halo 2 Limited Collector's Edition",
        :release_date => "11/09/2004",
            :platform => "Microsoft Xbox"
    }
  ]

game = games.first
  =>
  #<Gamesdb::Client::Game:0x00000001603f78> {
              :id => "9",
      :game_title => "Halo 2",
    :release_date => "05/31/2007",
        :platform => "PC"
  }

game.reload
  =>
  #<Gamesdb::Client::Game:0x00000001358490> {
              :id => "9",
      :game_title => "Halo 2",
    :release_date => "05/31/2007",
        :platform => "PC",
        :overview => "Halo 2 is the sequel to the highly successful and critically acclaimed Halo®: Combat Evolved. In Halo 2, the saga continues as Master Chief—a genetically enhanced super-soldier—is the only thing standing between the relentless Covenant and the destruction of all humankind.",
            :esrb => "M - Mature",
          :genres => "Action",
         :players => "2",
            :coop => "No",
       :publisher => "Microsoft",
       :developer => "Bungie",
          :rating => "8.3333",
          :images => {
        "fanart" => [
            [0] {
                "original" => "fanart/original/9-1.jpg",
                   "thumb" => "fanart/thumb/9-1.jpg"
            },
            [1] {
                "original" => "fanart/original/9-2.jpg",
                   "thumb" => "fanart/thumb/9-2.jpg"
            },
            [2] {
                "original" => "fanart/original/9-3.jpg",
                   "thumb" => "fanart/thumb/9-3.jpg"
            }
        ],
        "boxart" => "boxart/original/front/9-2.jpg"
    }
  }

platform = client.platforms.all.detect { |p| p.name == "Microsoft Xbox 360" }
  =>
  #<Gamesdb::Client::Platform:0x00000001ac9aa8> {
       :id => "15",
     :name => "Microsoft Xbox 360",
    :alias => "microsoft-xbox-360"
  }

platform.reload
  =>
  #<Gamesdb::Client::Platform:0x00000001ac9aa8> {
                :id => "15",
              :name => "Microsoft Xbox 360",
             :alias => "microsoft-xbox-360",
           :console => "http://www.youtube.com/watch?v=15.png",
        :controller => "http://www.youtube.com/watch?v=15.png",
          :overview => "The Xbox 360 is the second video game console produced by Microsoft and the successor to the Xbox. The Xbox 360 competes with Sony&#039;s PlayStation 3 and Nintendo&#039;s Wii as part of the seventh generation of video game consoles. As of September 30, 2011, 57.6 million Xbox 360 consoles have been sold worldwide.Several major features of the Xbox 360 are its integrated Xbox Live service that allows players to compete online, download arcade games, game demos, trailers, TV shows, music and movies and its Windows Media Center multimedia capabilities. The Xbox 360 also offers region specific access to third-party media streaming services such as Netflix and ESPN in the US or Sky Go in the UK.",
         :developer => "Microsoft",
      :manufacturer => "Microsoft",
               :cpu => "3.2 GHz PowerPC Tri-Core Xenon",
            :memory => "512 MB of GDDR3 RAM clocked at 700 MHz",
          :graphics => "500 MHz ATI Xenos",
             :sound => "Dolby Digital 5.1 (TOSLINK and HDMI)",
           :display => "1920x1080",
             :media => "Disc",
    :maxcontrollers => "4",
            :rating => "8.6",
            :images => {
               "fanart" => [
            [0] {
                "original" => "platform/fanart/15-1.jpg",
                   "thumb" => "platform/fanart/thumb/15-1.jpg"
            },
            [1] {
                "original" => "platform/fanart/15-2.jpg",
                   "thumb" => "platform/fanart/thumb/15-2.jpg"
            }
        ],
               "boxart" => "platform/boxart/15-1.jpg",
               "banner" => "platform/banners/15-1.jpg",
           "consoleart" => "platform/consoleart/15.png",
        "controllerart" => "platform/controllerart/15.png"
    }
  }
```
