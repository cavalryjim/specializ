class User2sController < ApplicationController
  respond_to :html,:json
  
  protect_from_forgery :except => [:post_data]
  
  # Don't forget to edit routes if you're using RESTful routing
  # 
  #resources :user2s,:only => [:index] do
  #   collection do
  #     post "post_data"
  #   end
  # end

  def post_data
    message=""
    user2_params = { :id => params[:id],:email => params[:email],:firstname => params[:firstname] }
    case params[:oper]
    when 'add'
      if params["id"] == "_empty"
        user2 = User2.create(user2_params)
        message << ('add ok') if user2.errors.empty?
      end
      
    when 'edit'
      user2 = User2.find(params[:id])
      message << ('update ok') if user2.update_attributes(user2_params)
    when 'del'
      User2.destroy_all(:id => params[:id].split(","))
      message <<  ('del ok')
    when 'sort'
      user2s = User2.all
      user2s.each do |user2|
        user2.position = params['ids'].index(user2.id.to_s) + 1 if params['ids'].index(user2.id.to_s) 
        user2.save
      end
      message << "sort ak"
    else
      message <<  ('unknown action')
    end
    
    unless (user2 && user2.errors).blank?  
      user2.errors.entries.each do |error|
        message << "<strong>#{User2.human_attribute_name(error[0])}</strong> : #{error[1]}<br/>"
      end
      render :json =>[false,message]
    else
      render :json => [true,message] 
    end
  end
  
  
  def index
    index_columns ||= [:id,:email,:firstname]
    current_page = params[:page] ? params[:page].to_i : 1
    rows_per_page = params[:rows] ? params[:rows].to_i : 10

    conditions={:page => current_page, :per_page => rows_per_page}
    conditions[:order] = params["sidx"] + " " + params["sord"] unless (params[:sidx].blank? || params[:sord].blank?)
    
    if params[:_search] == "true"
      conditions[:conditions]=filter_by_conditions(index_columns)
    end
    
    @user2s=User2.paginate(conditions)
    total_entries=@user2s.total_entries
    
    respond_with(@user2s) do |format|
      format.json { render :json => @user2s.to_jqgrid_json(index_columns, current_page, rows_per_page, total_entries)}  
    end
  end

end