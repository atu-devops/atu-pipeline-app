require 'rails_helper'

RSpec.describe 'Pipeline Elements Page', type: :feature do
  before do
    visit root_path  # Adjust the path according to your route
  end

  it 'loads successfully' do
    expect(page).to have_current_path(root_path)
    expect(page.status_code).to eq(200)
  end

  it 'has an unordered list' do
    expect(page).to have_selector('ul')
  end

  it 'lists the pipeline items' do
    within 'ul' do
      expect(page).to have_content('Github')
      expect(page).to have_content('CircleCI')
      expect(page).to have_content('Rspec')
      expect(page).to have_content('Heroku')
      expect(page).to have_content('Staging')
      expect(page).to have_content('Capybara')
      expect(page).to have_content('Production')
      expect(page).to have_content('Scout')
    end
  end
end
