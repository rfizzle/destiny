require 'rails_helper'

RSpec.describe 'health/index.html.erb', type: :feature do
  scenario 'returns a healthy redis check' do
    visit '/health'
    expect(page).to have_css('h1', text: 'Health#index')
  end
end
