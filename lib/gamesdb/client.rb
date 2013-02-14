class Gamesdb::Client < Cistern::Service

  model_path "gamesdb/models"
  request_path "gamesdb/requests"

  model :game
  collection :games
  request :list_games

  class Real
    attr_reader :connection

    def initialize(options={})
      url = options[:url] || 'http://thegamesdb.net/api'

      @connection = RestClient::Resource.new(url) #Excon.new(url)
    end

    def request(options)
      path    = options[:path]
      method  = options[:method]        || :get
      method  = method.to_sym
      headers = options[:headers]       || {}
      body    = options[:body]          || nil
      expects = options[:expects]       || 200
      query   = options[:query]         || nil

      connect_hash = {
        :method  => method,
        :headers => headers,
        :path    => path,
        :expects => expects,
        :body    => body,
        #:query   => query
      }

      path = "#{path}?#{query.map{|k,v| "#{URI.escape(k.to_s)}=#{URI.escape(v.to_s)}"}.join("&")}" unless query.empty?
      response = case method
                 when :get
                   connection[path].get(headers)
                 when :post
                   connection[path].post(body, headers)
                 when :delete
                   connection[path].delete(headers)
                 end

      document = Gamesdb::SaxDocument.new
      parser = Nokogiri::XML::SAX::PushParser.new(document)
      parser << response
      parser.finish
      document.body
    end
  end

  class Mock
    def initialize(options={})
    end

    def self.data
      @data ||= {}
    end

    def self.reset!
      @data = nil
    end

    def data
      self.class.data
    end
  end
end
