require 'spec_helper'
require 'sinatra/json'

describe "Index Controller" do

  describe "post articles" do
    before(:all) do
      post '/articles', {search: 'cats'}
    end

    it 'gets a list of articles' do

      expect(last_response.status).to eq(200)

    end

    it "displays search related content" do

      json = JSON.parse(last_response.body)

      expect(json['response']['results'][0]['id']).to include("cats")

    end
  end

  describe "post summary" do

    it "gets a summary" do

      post '/summary', {url: "http://google.com"}

      expect(last_response.status).to eq(200)

    end
  end
end