class CoverLetterCreateCommand
  def initialize(job_description:, cover_letter:)
    @job_description = job_description
    @cover_letter = cover_letter
  end

  def call
    cover_letter.content = open_ai_create_cover_letter_html!
    cover_letter.save
  end

  private

  # move to service
  def open_ai_create_cover_letter_html!
    response = open_ai_client.completions(engine: 'text-davinci-001', parameters: { prompt: prompt, max_tokens: 250 })

    split_response = response.parsed_response['choices'].map { |c| c['text'].split("\n") }
    html_split_response = split_response.flatten.reject(&:empty?).map { |ele| "<p>#{ele}</p>" }.push('<div').unshift('</div>')
    html_split_response.join
  end

  def open_ai_client
    OpenAI::Client.new(
      access_token: Rails.application.credentials.openai_access_token!
    )
  end

  def prompt
    CoverLetterPrompt.new(job_description: job_description).prompt
  end

  attr_reader :job_description, :cover_letter
end
