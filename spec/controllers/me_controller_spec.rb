require 'spec_helper'

describe MeController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'profile'" do
    it "should be successful" do
      get 'profile'
      response.should be_success
    end
  end

  describe "GET 'topic'" do
    it "should be successful" do
      get 'topic'
      response.should be_success
    end
  end

end
