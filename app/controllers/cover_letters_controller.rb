class CoverLettersController < ApplicationController
  def create
    # should this be here?
    # rework form
    @job_description = JobDescriptionForm.new(job_description_params).save!
    # requires persistence for ID
    @cover_letter = CoverLetter.create(job_description: @job_description)

    CoverLetterCreateJob.perform_async(
      job_description_id: @job_description.id,
      cover_letter_id: @cover_letter.id
    )

    session[:cover_letters] = [] unless session[:cover_letters]
    session[:cover_letters] << @cover_letter.id

    redirect_to @cover_letter
  end

  def show
    @cover_letter = CoverLetter.find(params[:id])
  end

  def update; end

  def edit; end

  def job_description_params
    params.require(:job_description).permit(:job_title, :company_information, :duties)
  end

  def cover_letter_params
    params.require(:cover_letter).permit(:title, :content)
  end
end
