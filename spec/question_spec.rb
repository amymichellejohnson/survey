require('spec_helper')

describe(Question) do
  it {should belong_to(:survey)}

  describe(".next") do
    it("returns the next question in the table") do
      survey = Survey.create({:name=>"animal survey"})
      question1 = Question.create({:description => "Do you like animals?", :survey_id => survey.id()})
      question2 = Question.create({:description => "Do you like dogs?", :survey_id => survey.id()})
      expect(question1.next()).to(eq(question2))
    end
  end
end
