require 'spec_helper'

describe "Bicycles" do
  let(:bicycle) { FactoryGirl.create(:bicycle, :name => 'First bike') }

  describe "GET /bicycles" do
    it "lists all bicycles" do
      bicycle
      visit bicycles_path
      page.should have_css 'td', :text => 'First bike'
    end
  end

  describe "#show" do
    it "shows a bicycle" do
      visit bicycle_path(bicycle)
      page.should have_css 'p', text: 'First bike'
    end
  end

  describe "#new" do
    it "lets you create new bicycles" do
      visit new_bicycle_path
      fill_in('Name', with: 'My first bike')
      click_button 'Save'
      page.should have_css('#notice', 'Bicycle was successfully saved')
    end
  end

  describe "#edit" do
    it "lets you change existing bicycles" do
      visit edit_bicycle_path(bicycle)
      fill_in('Name', with: 'My second bike')
      click_button 'Save'
      page.should have_css('#notice', 'Bicycle was successfully saved')
      page.save_and_open_page
      page.should have_css('p', :text => 'My second bike')
    end
  end

  describe "#destroy", js: true do
    it "lets you destroy/remove an existing bicycle" do
      bicycle
      visit bicycles_path
      page.evaluate_script('window.confirm = function() { return true; }')
      click_link 'Destroy'
      page.should_not have_css('td', 'My first bike')
    end
  end
end
