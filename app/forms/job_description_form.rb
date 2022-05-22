class JobDescriptionForm
  include ActiveModel::Model

  validates :company_information, :job_title, :duties, presence: true

  attr_accessor :job_title, :company_information, :duties

  def initialize(params = {})
    super(params)
  end

  def save!
    JobDescription.create!(
      duties: duties[0..400],
      company_information: company_information[0..400],
      job_title: job_title[0..100]
    )
  end
end
