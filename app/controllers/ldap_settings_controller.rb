class LdapSettingsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  respond_to :html, :json
  
  # GET /companies
  # GET /companies.xml
=begin
  def index
    @ldap_settings = LdapSetting.all

  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
    @ldap_setting = LdapSetting.find(params[:id])

  end
=end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @ldap_setting = LdapSetting.new
 
  end

  # GET /companies/1/edit
  def edit
    @ldap_setting = LdapSetting.find(params[:id])
    
  end

  # POST /companies
  # POST /companies.xml
  def create
    @ldap_setting = LdapSetting.new(params[:ldap_setting])
    @ldap_setting.company_id = current_user.company_id
    @ldap_setting.encrypt_password(params[:ldap_setting][:password])
    
    if @ldap_setting.save
      gflash :success => 'LDAP settings were successfully created' 
      redirect_to edit_ldap_setting_path(@ldap_setting) 
    else
      respond_with @ldap_setting
    end
    
  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    @ldap_setting = LdapSetting.find(params[:id])
    @ldap_setting.attributes = params[:ldap_setting]
    @ldap_setting.encrypt_password(params[:ldap_setting][:password])

    if @ldap_setting.save
      gflash :success => 'LDAP settings were successfully updated' 
      redirect_to edit_ldap_setting_path(@ldap_setting)
    else
      respond_with @ldap_setting
    end
    
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @ldap_setting = LdapSetting.find(params[:id])
    if @ldap_setting.destroy
      gflash :success => 'LDAP settings were removed'
      redirect_to me_path
    end
  end
  
  
end
