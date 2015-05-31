require 'dotenv'
require 'httparty'
require 'json'
Dotenv.load

module Smmry

  class Client

    include HTTParty
    format :json
    base_uri "api.smmry.com"

    def initialize

    end

    def summary(url)
      api_key = ENV["SMMRY_KEY"]
      response = self.class.get('/',{
        query: {"SM_API_KEY" => api_key,  "&SM_URL" =>url}
        })
      return response
    end

  end

end
