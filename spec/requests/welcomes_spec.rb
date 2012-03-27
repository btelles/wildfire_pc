require 'spec_helper'

describe "Welcomes" do
  describe "GET /welcomes" do
    it "works! (now write some real specs)" do
      get '/'
      response.body.should match /Welcome to the Super Bicycles website/
    end
  end
end
