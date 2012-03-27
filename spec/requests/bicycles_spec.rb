require 'spec_helper'

describe "Bicycles" do
  describe "GET /bicycles" do
    let(:bicycle) { FactoryGirl.create(:bicycle, :name => 'First bike') }

    it "lists all bicycles" do
      bicycle
      get bicycles_path
      response.body.should match /First bike/
    end
  end
end
