class JobDescriptionsController < ApplicationController
  def new
    @job_description = JobDescription.new
  end
end
