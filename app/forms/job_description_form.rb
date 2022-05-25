class JobDescriptionForm
  include ActiveModel::Model

  validates :company_name, :job_title, :duties, :skill, :experience, presence: true

  attr_accessor :job_title, :company_name, :duties, :experience, :skills

  def initialize(params = {})
    super(params)
  end

  def save!
    JobDescription.create!(
      duties: duties[0..400],
      company_name: company_name[0..100],
      job_title: job_title[0..100],
      experience: experience[0..50],
      skills: skills[0..350]
    )
  end
end
