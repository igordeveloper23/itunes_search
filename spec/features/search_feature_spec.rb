require 'rails_helper'

RSpec.feature 'Search', type: :feature, js: true do
  let(:search_term) { 'test' }
  let(:results_bottom_selector) { '.results-bottom' }
  let(:heart_icon) { 'bi-heart-fill' }

  before do
    visit '/'
    fill_in 'search_term', with: search_term
    click_button 'Search'
    expect(page).to have_selector(results_bottom_selector, visible: false, wait: 10)
  end

  scenario 'user submits a search and user toggles favorite status' do
    expect(page).to have_content('Title')

    favorite_icon = find("#results table tbody tr:first-child td:last-child i")
    favorite_icon.click

    expect(favorite_icon[:class]).to include(heart_icon)
  end
end