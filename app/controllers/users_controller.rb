class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  #helper_method :sort_column, :sort_direction
  #autocomplete :company, :name, :full => true
  respond_to :html, :json
  
  # GET /users
  # GET /users.xml
  def index
    #redirect_to me_path if !(current_user.role? :admin)
    @users = User.where(:company_id => current_user.company_id)
    #if current_user.role? :admin
    #  respond_to do |format|
    #    format.html # index.html.erb
    #    format.xml  { render :xml => @users }
    #  end
    #else
    #  redirect_to me_path, :notice => 'You can not access this resource.'
    #end
    respond_with @users
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    redirect_to users_path
    #@user = User.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @user }
    #end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    #@user = User.new
    @user.active = true

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    #@user = User.find(params[:id])
    @authentications = current_user.authentications if current_user == @user
    @return_path = me_path ? params[:return] == 'me' : users_path
    
  end

  # POST /users
  # POST /users.xml
  def create
    #@user = User.new(params[:user])
    #if params[:user][:role_ids]
    #  @user.update_roles(params[:user][:role_ids])  
    #else 
    #  @user.add_employee_role
    #end
    @user.update_roles(params[:user][:role_ids]) ? params[:user][:role_ids] : @user.add_employee_role
    @user.company_id = current_user.company_id
    @user.generate_password if @user.password.nil?
    @user.notify_account(@user.password) if @user.save
    
    respond_with(@user)
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    #@user = User.find(params[:id])
    return_path = params[:return_path]
    @user.update_roles(params[:user][:role_ids]) if params[:user][:role_ids]
    
    # JDavis: If do not remove these params, Devise will fail to validate
    #if params[:user][:password].blank?
    #  params[:user].delete(:password)
    #  params[:user].delete(:password_confirmation)
    #end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(root_path, :notice => return_path ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
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
    
    redirect_to topic_group_iteration_url(@topic_group, @iteration), :notice => 'Your list was successfully submitted.'
  end
    
  def approve_new_elements
    iteration = Iteration.find(params[:iteration_id])
    topic_group = TopicGroup.find(iteration.topic_group_id)
    
   
    current_user.approve_new_elements(iteration, params[:approve])
   
    redirect_to topic_group_iteration_url(topic_group, iteration)+'#tabs-4', :notice => 'New elements approved and will be included in the next iteration.'
  end
  
  def import_users
    errors = current_user.import_users(params[:file])
    #current_user.delay(:run_at => Time.zone.now ).import_users(params[:file])
   
    #redirect_to users_path, :notice => "There were " + errors.to_s + " errors uploading this list. "
    redirect_to users_path, :notice => "Uploading users. "
  end
  
  
  private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
