class CoverLetterPrompt
  include ActiveModel::Validations

  validates :job_description, presence: true
  delegate :job_title, :company_information, :duties, to: :job_description, prefix: true

  def initialize(job_description:)
    @job_description = job_description
  end

  def prompt
    [ leading_question_part, job_title_part, company_information_part, duties_part, '.', "\n" ].join("\n")
  end

  private

  def leading_question_part
    'Write a professional fully formatted cover letter for:'
  end

  def duties_part
    "Duties and my Skills: #{job_description_duties}"
  end

  def company_information_part
    "Company Information: #{job_description_company_information}"
  end

  def job_title_part
    "Job Title: #{job_description_job_title}"
  end

  attr_reader :job_description
end
