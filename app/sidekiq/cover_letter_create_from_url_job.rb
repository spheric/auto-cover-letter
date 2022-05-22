class CoverLetterCreateFromUrlJob
  include Sidekiq::Job

  def perform(*args)
    CoverLetterCreateFromUrlCommand.perform
    # Do something
  end
end
