class CoverLetterCreateJob
  include Sidekiq::Job

  def perform(*args)
    CoverLetterCreateCommand.new(
      cover_letter: CoverLetter.find(args.first['cover_letter_id']),
      job_description: JobDescription.find(args.first['job_description_id'])
    ).call
  end
end
