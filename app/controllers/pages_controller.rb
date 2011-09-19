class PagesController < ApplicationController
  def me
    @title = "Me"
    
    @topic_groups=TopicGroup.all
    @elements = Element.all
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
