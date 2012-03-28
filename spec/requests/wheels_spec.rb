require 'spec_helper'

describe "Wheels" do
  let(:bicycle) { FactoryGirl.create(:bicycle) }
  let(:wheel) { FactoryGirl.create(:wheel, :name => 'First wheel', :bicycle => bicycle) }

  describe "GET /wheels" do
    it "lists all wheels" do
      wheel
      visit bicycle_wheels_path(bicycle)
      page.should have_css 'td', text: 'First wheel'
    end
  end

  describe "#show" do
    it "shows a wheel" do
      visit bicycle_wheel_path(bicycle, wheel)
      page.should have_css 'p', text: 'First wheel'
    end
  end

  describe "#new" do
    it "lets you create new wheels" do
      visit new_bicycle_wheel_path(bicycle)
      fill_in('Name', with: 'my first wheel')
      click_button 'Save'
      page.should have_css('#notice', text: 'Wheel was successfully saved')
    end
  end

  describe "#edit" do
    it "lets you change existing wheels" do
      visit edit_bicycle_wheel_path(bicycle, wheel)
      fill_in('Name', with: 'my second wheel')
      click_button 'Save'
      page.should have_css('#notice', text: 'Wheel was successfully saved')
      page.should have_css('p', text: 'my second wheel')
    end
  end

  describe "#destroy", js: true do
    it "lets you destroy/remove an existing wheel" do
      wheel
      visit bicycle_wheels_path(bicycle)
      page.evaluate_script('window.confirm = function() { return true; }')
      click_link 'Destroy'
      page.should_not have_css('td', text: 'my first wheel')
    end
  end
end
