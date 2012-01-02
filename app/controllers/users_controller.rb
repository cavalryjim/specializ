class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  #helper_method :sort_column, :sort_direction
  autocomplete :company, :name, :full => true
  
  # GET /users
  # GET /users.xml
  def index
    #redirect_to me_path if !(current_user.role? :admin)
    @users = User.where(:company_id => current_user.company_id)
    if current_user.role? :admin
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @users }
      end
    else
      redirect_to me_path, :notice => 'You can not access this resource.'
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    #@user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    #@user = User.new

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
    @user.role_ids = params[:user][:role_ids]
    @user.company_id = current_user.company_id
    
    if @user.password.nil?
      generated_password = Devise.friendly_token.first(6)
      @user.password = generated_password
      @user.notify_account(generated_password)
    end
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_path, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    #params[:user][:role_ids] ||= []
    #@user = User.find(params[:id])
    return_path = params[:return_path]
    if @user.role? :pnetz_admin
      @user.role_ids = [1,2,3,4,5]
    else
      @user.role_ids = params[:user][:role_ids] unless return_path == me_path
    end
    
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
  
  def admin_created_user
    
  end
  
  private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
