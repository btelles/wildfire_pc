require 'spec_helper'

describe Bicycle do
  it "has a 'name' attribute" do
    Bicycle.create(name: 'My bike').should be
  end
end
