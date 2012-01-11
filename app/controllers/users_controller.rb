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
    
    if params[:return] == 'me'
      @return_path = me_path
    else
      @return_path = users_path
    end
  end

  # POST /users
  # POST /users.xml
  def create
    #@user = User.new(params[:user])
    if params[:user][:role_ids]
      @user.update_roles(params[:user][:role_ids])  
    else 
      @user.add_employee_role
    end
    @user.company_id = current_user.company_id
    
    if @user.password.nil?
      generated_password = Devise.friendly_token.first(6)
      @user.password = generated_password
      @user.notify_account(generated_password)
    end
    
    if @user.save
      
    end
    
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
        format.html { redirect_to(return_path, :notice => 'User was successfully updated.' ) }
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
  
  def import_users
    errors = current_user.import_users(params[:file])
    
    redirect_to users_path, :notice => errors
  end
  
  
  private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
