require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/start_page") do
  erb(:start_page)
end

get("/participant/main") do
  @surveys = Survey.all
  erb(:participant_main)
end

get("/participant/survey/:id") do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:participant_survey)
end

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

get("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:survey)
end

patch("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i)
  name = params.fetch("name")
  @survey.update({:name => name})
  erb(:survey)
end

delete("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i)
  @survey.destroy
  @surveys = Survey.all
  erb(:index)
end

post("/questions") do
  description = params.fetch("description")
  survey_id = params.fetch("survey_id").to_i
  question = Question.create({ :description => description, :survey_id => survey_id })
  @survey = Survey.find(survey_id)
  erb(:survey)
end

get("/questions/:id") do
  @question= Question.find(params.fetch("id").to_i)
  erb(:question)
end

delete("/questions/:id") do
  @question= Question.find(params.fetch("id").to_i)
  @survey= @question.survey
  @question.destroy
  erb(:survey)
end

post("/responses") do
  answer = params.fetch("answer")
  question_id = params.fetch("question_id")
  response = Response.create({:answer => answer, :question_id => question_id})
  @question = Question.find(question_id)
  erb(:question)
end
