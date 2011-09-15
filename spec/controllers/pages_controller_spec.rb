require 'spec_helper'

describe PagesController do

  describe "GET 'me'" do
    it "should be successful" do
      get 'me'
      response.should be_success
    end
  end

  describe "GET 'manager'" do
    it "should be successful" do
      get 'manager'
      response.should be_success
    end
  end

  describe "GET 'hr'" do
    it "should be successful" do
      get 'hr'
      response.should be_success
    end
  end

  describe "GET 'admin'" do
    it "should be successful" do
      get 'admin'
      response.should be_success
    end
  end

  describe "GET 'pnetz'" do
    it "should be successful" do
      get 'pnetz'
      response.should be_success
    end
  end

end
