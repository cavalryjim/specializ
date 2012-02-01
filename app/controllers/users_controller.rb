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
    @assigned_groups = current_user.root_grouping.id
    @assigned_roles = []

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
    @assigned_groups = @user.grouping_ids
    @assigned_roles = @user.role_ids
    
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
    
    if params.has_key?(:user_roles)
      @user.update_roles(params[:user_roles])  
    else 
      @user.add_employee_role
    end
    
    @user.company_id = current_user.company_id
    @user.generate_password if @user.password.nil?
    
    if @user.save && params.has_key?(:user_groupings)
      @user.update_groupings(params[:user_groupings])
      @user.notify_account(@user.password)
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
    #@user = User.find(params[:id])
    return_path = params[:return_path]
    #gflash :notice => return_path
    #return_path = users_path
    
    if params.has_key?(:user_groupings) && return_path == users_path && @user.update_attributes(params[:user]) 
      @user.update_roles(params[:user_roles]) if params[:user_roles]
      @user.update_groupings(params[:user_groupings])
      gflash :success => "Profile updated."
      redirect_to users_path
    elsif return_path != users_path && @user.update_attributes(params[:user])
      gflash :success => "Profile updated."
      redirect_to :back
    else
      @user.errors[:base] << "You must assign the user to one or more groups." unless params.has_key?(:user_groupings)
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
    current_user.rate_elements(@iteration.id, resubmit, params[:new], params[:rating])
    gflash :success => "List submitted."
    redirect_to topic_group_iteration_url(@topic_group, @iteration)
  end
    
  def approve_new_elements
    iteration = Iteration.find(params[:iteration_id])
    topic_group = TopicGroup.find(iteration.topic_group_id)
    current_user.approve_new_elements(iteration, params[:approve])
    
    gflash :success => "Elements approved and will be included in the next iteration."
    redirect_to topic_group_iteration_url(topic_group, iteration)+'#tabs-4'
  end
  
  def import_users
    errors = current_user.import_users(params[:file])
    #current_user.delay(:run_at => Time.zone.now ).import_users(params[:file])
   
    gflash :success => "Uploading users. "
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
