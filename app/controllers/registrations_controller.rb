class RegistrationsController < Devise::RegistrationsController
  def create
    super
    @user.active = false 
    @user.save
    session[:omniauth] = nil unless @user.new_record?
  end

  #def create
  #  @user = User.new(params[:user])
  #  @user.role_ids = params[:user][:role_ids]
    #@user.company_id = current_user.company_id
    
  #  respond_to do |format|
  #    if @user.save
  #      format.html { redirect_to(users_path, :notice => 'User was successfully created.') }
  #      format.xml  { render :xml => @user, :status => :created, :location => @user }
  #    else
  #      format.html { render :action => "new" }
  #      format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
  
end
