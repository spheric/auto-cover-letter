class CoverLettersController < ApplicationController
  def create
    # should this be here?
    # rework form
    @job_description = JobDescriptionForm.new(job_description_params).save!
    # requires persistence for ID
    @cover_letter = CoverLetter.create(job_description: @job_description)

    if job_description_params[:url].present?
      CoverLetterCreateFromUrlJob.perform_async(job_description_params[:url])
    else
      CoverLetterCreateJob.perform_async(
        job_description_id: @job_description.id,
        cover_letter_id: @cover_letter.id
      )
    end

    session[:cover_letters] = [] unless session[:cover_letters]
    session[:cover_letters] << @cover_letter.id

    redirect_to @cover_letter
  end

  def full_index
    @cover_letters = CoverLetter.all
  end

  def show
    @cover_letter = CoverLetter.find_by(id: params[:id])

    if can_see_cover_letter?(@cover_letter)
      render 'show'
    else
      redirect_to :root, notice: 'You are not authorized to view this cover letter.'
    end
  end

  def update; end

  def edit; end

  def index
    @cover_letters = CoverLetter.where(id: session[:cover_letters]) || CoverLetter.none
  end

  def can_see_cover_letter?(cover_letter)
    cover_letter && session[:cover_letters].include?(cover_letter.id)
  end

  def job_description_params
    params.require(:job_description).permit(:job_title, :company_name, :duties, :url, :skills, :experience)
  end

  def cover_letter_params
    params.require(:cover_letter).permit(:title, :content)
  end
end
