require "spec_helper"

describe(Survey) do
  it { should have_and_belong_to_many(:questions) }

  it("validates the presence of the survey name") do
    survey = Survey.new({:name => ""})
    expect(survey.save()).to(eq(false))
  end
end
