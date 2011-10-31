class PagesController < ApplicationController
  before_filter :authenticate_user!
  
  def me
    @title = "Me"
    
    @topic_groups=TopicGroup.all
    #@elements = Element.all
    @elements = nil
  end

  def manager
    @title = "Manager"
  end

  def hr
    @title = "HR"
  end

  def admin
    @title = "Admin"
  end

  def pnetz
    @title = "Pnetz Admin"
  end

end
