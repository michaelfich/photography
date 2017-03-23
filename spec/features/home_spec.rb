require 'rails_helper'

feature 'home page' do
  it 'should display the app\' name as the title' do
    visit '/'
    find('h1').text.should eq('Photography')
  end

  it 'should have a summary' do
    visit '/'
    expect(page).to have_selector('.home__summary')
  end
end
