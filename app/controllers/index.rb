get '/' do
  api = Guardian::Client.new
  erb :index
end

post '/articles' do
  api = Guardian::Client.new
  articles = api.articles(params[:search])
  return json(articles)
end

post '/summary' do
  in_sum = Smmry::Client.new
  return json(in_sum.summary(params[:url]))
end

