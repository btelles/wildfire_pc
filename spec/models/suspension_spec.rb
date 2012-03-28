require 'spec_helper'

describe Suspension do
  it "belongs to a bicycle" do
    Suspension.create(:name => 'my suspension', :bicycle => Bicycle.create(:name => 'my bike')).should be
  end
end
