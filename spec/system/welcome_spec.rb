require 'rails_helper'

RSpec.describe 'Welcome', type: :system do
  before do
    driven_by(:selenium)

    visit '/'
  end

  it 'shows me welcome title' do
    expect(page).to have_text('AI Cover Letter')
  end

  it 'shows me welcome description' do
    expect(page).to have_text('Provide some information about a job')
  end

  it 'allows me to proceed to the next step' do
    page.click_on('Start')

    expect(page).to have_text('Upload Job Description')
  end
end
