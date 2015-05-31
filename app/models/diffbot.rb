# Not implemented yet

require 'httparty'

module Diffbot

  class Client

    include HTTParty
    format :json
    base_uri "api.diffbot.com/v3/"

    def initialize

    end

    def full_text(url)
      api_key = ENV["DIFFBOT_KEY"]
      response = self.class.get('/article',{
        query: { "token" => api_key,  "url" => url }
        })
      return JSON.parse(response.body)
    end

  end

end
