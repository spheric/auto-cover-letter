class CoverLetterPrompt
  include ActiveModel::Validations

  validates :job_description, presence: true
  delegate :job_title, :company_name, :duties, :experience, :skills, to: :job_description, prefix: true

  def initialize(job_description:)
    @job_description = job_description
  end

  def prompt
    [leading_question_part, job_title_part, company_name_part, duties_part, experience_part, skills_part, '.', "\n"].join("\n")
  end

  private

  def leading_question_part
    'Write a fully formatted professional cover letter focussing on my skills for:'
  end

  def duties_part
    "Job Duties: #{job_description_duties}"
  end

  def company_name_part
    "Company Name: #{job_description_company_name}"
  end

  def job_title_part
    "Job Title: #{job_description_job_title}"
  end

  def skills_part
    "My Skills: #{job_description_skills}"
  end

  def experience_part
    "My experience (years): #{job_description_experience}"
  end

  attr_reader :job_description
end
