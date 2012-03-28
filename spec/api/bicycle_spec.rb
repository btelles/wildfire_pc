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

  it "can create multiple bicycles in one request" do
    post '/bicycles', {:bicycles => [{:name => 'my first bike', :wheels_attributes => [{:name => 'my first wheel'}]},
                                     {:name => 'my second bike', :wheels_attributes => [{:name => 'my second wheel'}]}]}
    names = Bicycle.all.map(&:name)
    names.should include('my first bike')
    names.should include('my second bike')
    wheels = Bicycle.all.map(&:wheels).flatten.map(&:name)
    wheels.should include('my first wheel')
    wheels.should include('my second wheel')
  end
end
