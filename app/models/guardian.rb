require 'dotenv'
require 'httparty'
require 'json'
Dotenv.load

module Guardian

  class Client

    include HTTParty
    format :json
    base_uri "content.guardianapis.com"

    def initialize

    end

    def articles(parameters)
      api_key = ENV["GUARDIAN_KEY"]
      response = self.class.get('/search', {
        query: {"api-key" => api_key,  q: parameters }
        })
      return JSON.parse(response.body)
    end

  end

end
