class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many :responses, dependent: :destroy
  validates(:description, :presence => true)
end
