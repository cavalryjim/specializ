require 'spec_helper'

describe ManagerController do

  describe "GET 'manage'" do
    it "should be successful" do
      get 'manage'
      response.should be_success
    end
  end

  describe "GET 'setup'" do
    it "should be successful" do
      get 'setup'
      response.should be_success
    end
  end

  describe "GET 'staff'" do
    it "should be successful" do
      get 'staff'
      response.should be_success
    end
  end

  describe "GET 'grouping'" do
    it "should be successful" do
      get 'grouping'
      response.should be_success
    end
  end

end
