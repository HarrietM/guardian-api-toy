require 'spec_helper'
require 'sinatra/json'

describe Guardian do

  before(:each) do
    @parameters = "cats"
    @meow = instance_double("meow", :body => "meow")
    allow(Guardian::Client).to receive(:get).with("/search", {query: {"api-key" => ENV["GUARDIAN_KEY"],  q: @parameters }}).and_return(@meow)
    allow(JSON).to receive(:parse).with("meow").and_return("meow meow")
  end

  it "returns articles matching search criteria" do
    guardian = Guardian::Client.new
    expect(guardian.articles(@parameters)).to eq("meow meow")
  end

end