# frozen_string_literal: true

class CoverLetterFormComponent < ApplicationComponent
  def initialize(job_description:)
    @job_description = job_description
  end
end
