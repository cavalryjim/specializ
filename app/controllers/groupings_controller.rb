class GroupingsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  autocomplete :user, :last_name, :extra_data => [:id, :first_name], :display_value => :name, :scope => [:belongs_company]
  respond_to :html, :json
  
  # GET /groupings
  # GET /groupings.xml
  def index
    #@groupings = Grouping.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groupings }
    end
  end

  # GET /groupings/1
  # GET /groupings/1.xml
  def show
    #redirect_to groupings_path
    @grouping = Grouping.find(params[:id])
    redirect_to edit_grouping_path(@grouping)
    #respond_with(@grouping)
  end

  # GET /groupings/new
  # GET /groupings/new.xml
  def new
    #@groupings = Grouping.where(:company_id => current_user.company_id).sort_by{|g| g[:full_name]}
    #@groupings = Company.find(current_user.company_id).groupings
    #@groupings.sort_by{ |g| g[:full_name] }
    #puts @groupings
    #@grouping = Grouping.new
    @seed_id = Grouping.where(:company_id => current_user.company_id).first.id
    @users = []
    @root = false

    respond_with(@grouping)
  end

  # GET /groupings/1/edit
  def edit
    #@grouping = Grouping.find(params[:id])
    @root = @grouping.root?
    @seed_id = @grouping.id
    @groupings = Company.find(current_user.company_id).groupings
    @users = @grouping.users
    
    respond_with(@grouping)
  end

  # POST /groupings
  # POST /groupings.xml
  def create
    #redirect_to new_grouping_path if params[:grouping][:name] == ''
    #@grouping = Grouping.new(params[:grouping])
    #@grouping.company_id = current_user.company_id

    if @grouping.save
      flash[:notice] = 'Grouping was successfully created.' 
    else
      @seed_id = Grouping.where(:company_id => current_user.company_id).first.id
      @users = []
      @root = false
    end
    
    #respond_with(@grouping)
    redirect_to edit_grouping_path(@grouping)
  end

  # PUT /groupings/1
  # PUT /groupings/1.xml
  def update
    #@grouping = Grouping.find(params[:id])
    params[:grouping].delete :parent_id if (@grouping.root? or (params[:grouping][:parent_id].to_i == params[:id].to_i))
   
    respond_to do |format|
      if @grouping.update_attributes(params[:grouping])
        format.html { redirect_to edit_grouping_path(@grouping), :notice => 'Grouping was successfully updated.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @grouping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groupings/1
  # DELETE /groupings/1.xml
  def destroy
    #@grouping = Grouping.find(params[:id])
    @grouping.destroy

    respond_to do |format|
      format.html { redirect_to(groupings_url) }
      format.xml  { head :ok }
    end
  end
  
  def remove
    @grouping = Grouping.find(params[:grouping_id])
    @grouping.users.delete(User.find(params[:user_id]))
    #@grouping.save
    redirect_to edit_grouping_path(@grouping)+'#tabs-2', :notice => 'User successfully removed from group.'
  end
  
  def new_user
    @grouping = Grouping.find(params[:id])
    #redirect_to edit_grouping_path(@grouping)+'#tabs-2', :notice => 'User successfully added to group.'
  end
  
  def add_user
    @grouping = Grouping.find(params[:id])
    user = User.find(params[:grouping_user_id])
    if @grouping.users.include?(user)
      new_notice = 'User is already in this group.'
    else
      @grouping.users << user 
      new_notice =  'User successfully added to group.'
    end
    #@grouping.save
    redirect_to edit_grouping_path(@grouping)+'#tabs-2', :notice => new_notice
  end
end
