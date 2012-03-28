require 'spec_helper'

describe "Suspensions" do
  let(:bicycle) { FactoryGirl.create(:bicycle) }
  let(:suspension) { FactoryGirl.create(:suspension, :name => 'First suspension', :bicycle => bicycle) }

  describe "GET /suspensions" do
    it "lists all suspensions" do
      suspension
      visit bicycle_suspensions_path(bicycle)
      page.should have_css 'td', text: 'First suspension'
    end
  end

  describe "#show" do
    it "shows a suspension" do
      visit bicycle_suspension_path(bicycle, suspension)
      page.should have_css 'p', text: 'First suspension'
    end
  end

  describe "#new" do
    it "lets you create new suspensions" do
      visit new_bicycle_suspension_path(bicycle)
      fill_in('Name', with: 'my first suspension')
      click_button 'Save'
      page.should have_css('#notice', text: 'Suspension was successfully saved')
    end
  end

  describe "#edit" do
    it "lets you change existing suspensions" do
      visit edit_bicycle_suspension_path(bicycle, suspension)
      fill_in('Name', with: 'my second suspension')
      click_button 'Save'
      page.should have_css('#notice', text: 'Suspension was successfully saved')
      page.should have_css('p', text: 'my second suspension')
    end
  end

  describe "#destroy", js: true do
    it "lets you destroy/remove an existing suspension" do
      suspension
      visit bicycle_suspensions_path(bicycle)
      page.evaluate_script('window.confirm = function() { return true; }')
      click_link 'Destroy'
      page.should_not have_css('td', text: 'my first suspension')
    end
  end
end
