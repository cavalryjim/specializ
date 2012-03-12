class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  #helper_method :sort_column, :sort_direction
  #autocomplete :company, :name, :full => true
  respond_to :html, :json, :xml
  
  # GET /users
  # GET /users.xml
  def index
    @title = 'Admin'
    @users = User.where(:company_id => current_user.company_id)
    
    respond_with @users
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    redirect_to users_path
    
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    #@user = User.new
    @user.active = true
    @user.role_ids = [1]
    @user.groupings << current_user.root_grouping
    #@assigned_roles = []

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    #@user = User.find(params[:id])
    @title = @user
    @authentications = current_user.authentications if current_user == @user
    #@assigned_groups = @user.grouping_ids
    #@assigned_roles = @user.role_ids
    
    if params[:return] == 'me'
      @return_path = me_path
    else 
      @return_path = users_path
    end
    #@return_path = me_path ? params[:return] == 'me' : users_path
    
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user.company_id = current_user.company_id

    password = @user.password.nil? ? @user.generate_password : false
    
    if @user.save && params.has_key?(:multiselect_user_grouping_ids)
      @user.update_groupings(params[:user][:grouping_ids])
      @user.notify_account(password) if password
      params.has_key?(:multiselect_user_role_ids) ? @user.update_roles(params[:user][:role_ids]) : @user.add_employee_role
      gflash :success => "User created."
    else
      @user.errors[:base] << "You must assign the user to one or more groups." unless params.has_key?(:user_groupings)
      @assigned_groups = current_user.root_grouping.id
    end
    
    respond_with(@user)
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    return_path = params[:return_path]
   
    @user.reset_password if params[:reset_credentials]
      
    if params.has_key?(:multiselect_user_grouping_ids) && (return_path.to_s == users_path.to_s) && @user.update_attributes(params[:user]) 
      @user.update_roles(params[:user][:role_ids]) if params.has_key?(:multiselect_user_role_ids)
      @user.update_groupings(params[:user][:grouping_ids])
      gflash :success => "Profile updated."
      redirect_to users_path
    elsif (return_path.to_s != users_path.to_s) && @user.update_attributes(params[:user])
      gflash :success => "Profile updated."
      redirect_to :back
    else
      @user.errors[:base] << "You must assign the user to one or more groups." unless params[:user][:grouping_ids]
      @return_path = return_path
      respond_with(@user)
    end
    
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    #@user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def rate_elements
    @iteration = Iteration.find(params[:iteration_id])
    @topic_group = TopicGroup.find(@iteration.topic_group_id)
    resubmit = params[:resubmit]
    
    if @iteration.active
      current_user.rate_elements(@iteration.id, resubmit, params[:new], params[:rating], params[:e_attribute])
      gflash :success => "List submitted."
    else
      gflash :notice => "Iteration is closed."
    end
      
    redirect_to topic_group_iteration_url(@topic_group, @iteration)
  end
    
  def approve_new_elements
    iteration = Iteration.find(params[:iteration_id])
    topic_group = TopicGroup.find(iteration.topic_group_id)
    current_user.approve_new_elements(iteration, params[:approve])
    
    gflash :success => "Elements approved and will be included in the next iteration."
    redirect_to topic_group_iteration_url(topic_group, iteration)
  end
  
  def import_users
    if params[:file]
      errors = current_user.import_users(params[:file])
      #current_user.delay(:run_at => Time.zone.now ).import_users(params[:file])
      gflash :success => "Uploading users."
      #gflash :notice => errors.to_s
    else
      gflash :notice => "Please select an appropriate file."
    end
    redirect_to users_path
  end
  
  
  private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
