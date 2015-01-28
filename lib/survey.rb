class Survey < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  validates(:name, :presence => true)
  before_save(:titlecase_name)

private
  def titlecase_name
    self.name=(name.downcase.titlecase)
  end
end
