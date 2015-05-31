require 'spec_helper'
require 'sinatra/json'

describe Smmry do

  before(:each) do
    @url = "http://google.com"
    @meow = instance_double("meow", :name => "meow")
    allow(Smmry::Client).to receive(:get).with("/", {query: {"SM_API_KEY" => ENV["SMMRY_KEY"],  "&SM_URL" => @url}}).and_return(@meow)
    allow(JSON).to receive(:parse).with("meow").and_return("meow")
  end

  it "returns a summary of a url" do
    smmry = Smmry::Client.new
    expect(smmry.summary(@url).name).to eq("meow")
  end

end