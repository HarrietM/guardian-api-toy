# Not implemented yet
require 'dotenv'
Dotenv.load
require 'indico'

Indico.api_key=ENV["INDICO_KEY"]


module Indico

  class Client

    # include HTTParty
    # format :json
    # base_uri "api.smmry.com"

    def initialize

    end

    def political(text)
      return Indico.political(text)
    end

  end

end