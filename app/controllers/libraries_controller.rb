class LibrariesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  respond_to :html, :json
  
  
  # GET /libraries
  # GET /libraries.xml
  def index
    @libraries = current_user.libraries.order('lft ASC')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @libraries }
    end
  end

  # GET /libraries/1
  # GET /libraries/1.xml
  def show
    @library = Library.find(params[:id])
    @objectives = @library.library_objectives

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @library }
    end
  end

  # GET /libraries/new
  # GET /libraries/new.xml
  def new
    @library = Library.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @library }
    end
  end

  # GET /libraries/1/edit
  def edit
    @library = Library.find(params[:id])
    @objectives = @library.library_objectives
    
  end

  # POST /libraries
  # POST /libraries.xml
  def create
    @library = Library.new(params[:library])

    respond_to do |format|
      if @library.save
        format.html { redirect_to(@library, :notice => 'Library was successfully created.') }
        format.xml  { render :xml => @library, :status => :created, :location => @library }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @library.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /libraries/1
  # PUT /libraries/1.xml
  def update
    @library = Library.find(params[:id])

    respond_to do |format|
      if @library.update_attributes(params[:library])
        format.html { redirect_to(@library, :notice => 'Library was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @library.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /libraries/1
  # DELETE /libraries/1.xml
  def destroy
    @library = Library.find(params[:id])
    @library.destroy

    respond_to do |format|
      format.html { redirect_to(libraries_url) }
      format.xml  { head :ok }
    end
  end
  
  def import_libraries
    #root = current_user.root_grouping
    
    if params[:file]
      errors = current_user.import_libraries(params[:file])
      gflash :success => 'There were ' + errors.to_s + ' errors.' 
    else
      gflash :notice => 'Please select an appropriate file to upload.'
    end
    
    redirect_to libraries_path
  end
  
  # JDavis: this method imports objectives from a spreadsheet
  def import_objectives
     @library = Library.find(params[:library_id])
     
     if params[:file]
      @library.import_objectives(params[:file])
      gflash :success => "Objectives imported."
     else
      gflash :notice => "Please select an appropriate file."
     end
    
    redirect_to :back
  end
  
end
