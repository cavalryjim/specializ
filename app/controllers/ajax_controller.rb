class AjaxController < ApplicationController
  autocomplete :company, :name

  #def companies
  #  names = Company.all
    
  #  list = names.map {|u| Hash[ :id => u.id, :label => u.name, :name => u.name]}
  #  render :json => list
  #end
end
