require 'spec_helper'

describe Wheel do
  it "belongs to a bicycle" do
    Wheel.create(:name => 'my wheel', :bicycle => Bicycle.create(:name => 'my bike')).should be
  end
end
