require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @surveys= Survey.all()
  erb(:index)
end

post('/') do
  @surveys = Survey.all
  name = params.fetch("name")
  Survey.create({:name => name})
  erb(:index)
end
