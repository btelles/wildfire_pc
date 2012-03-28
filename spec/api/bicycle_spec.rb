require 'spec_helper'

describe "Bicycle API", :type => :request do
  let(:bicycle) { FactoryGirl.create(:bicycle)}

  def json_response
    JSON.parse(response.body)
  end

  it "can list bicycles" do
    bicycle
    get '/bicycles.json'
    json_response[0]['name'].should == bicycle.name
    json_response[0]['id'].should == bicycle.id
  end

  it "can create bicycles" do
    post '/bicycles', {:bicycle => {:name => 'my first bike'}}
    Bicycle.first.name.should == 'my first bike'
  end

  it "can create bicycles with suspensions" do
    post '/bicycles', {:bicycle => {:name => 'my first bike', :suspensions_attributes => [{:name => 'my first suspension'}]}}
    Bicycle.first.suspensions.first.name.should == 'my first suspension'
  end

  it "can create bicycles with wheels" do
    post '/bicycles', {:bicycle => {:name => 'my first bike', :wheels_attributes => [{:name => 'my first wheel'}]}}
    Bicycle.first.wheels.first.name.should == 'my first wheel'
  end
end
