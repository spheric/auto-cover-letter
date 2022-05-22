class OpenAiClient
  extend Limiter::Mixin

  limit_method :completions, rate: 55

  def completions(prompt:)
    client.completions(engine: 'text-davinci-001', parameters: { prompt: prompt, max_tokens: 250 })
  end

  private

  def client
    @client ||= OpenAI::Client.new(
      access_token: Rails.application.credentials.openai_access_token!
    )
  end
end
