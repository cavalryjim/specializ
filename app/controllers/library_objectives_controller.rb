class LibraryObjectivesController < ApplicationController
  # GET /library_objectives
  # GET /library_objectives.xml
  def index
    @library_objectives = LibraryObjective.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @library_objectives }
    end
  end

  # GET /library_objectives/1
  # GET /library_objectives/1.xml
  def show
    @library_objective = LibraryObjective.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @library_objective }
    end
  end

  # GET /library_objectives/new
  # GET /library_objectives/new.xml
  def new
    @library_objective = LibraryObjective.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @library_objective }
    end
  end

  # GET /library_objectives/1/edit
  def edit
    @library_objective = LibraryObjective.find(params[:id])
  end

  # POST /library_objectives
  # POST /library_objectives.xml
  def create
    @library_objective = LibraryObjective.new(params[:library_objective])

    respond_to do |format|
      if @library_objective.save
        format.html { redirect_to(@library_objective, :notice => 'Library objective was successfully created.') }
        format.xml  { render :xml => @library_objective, :status => :created, :location => @library_objective }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @library_objective.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /library_objectives/1
  # PUT /library_objectives/1.xml
  def update
    @library_objective = LibraryObjective.find(params[:id])

    respond_to do |format|
      if @library_objective.update_attributes(params[:library_objective])
        format.html { redirect_to(@library_objective, :notice => 'Library objective was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @library_objective.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /library_objectives/1
  # DELETE /library_objectives/1.xml
  def destroy
    @library_objective = LibraryObjective.find(params[:id])
    @library_objective.destroy

    respond_to do |format|
      format.html { redirect_to(library_objectives_url) }
      format.xml  { head :ok }
    end
  end
end
