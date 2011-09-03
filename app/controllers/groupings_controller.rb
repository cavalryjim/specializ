class GroupingsController < ApplicationController
  # GET /groupings
  # GET /groupings.xml
  def index
    @groupings = Grouping.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groupings }
    end
  end

  # GET /groupings/1
  # GET /groupings/1.xml
  def show
    @grouping = Grouping.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @grouping }
    end
  end

  # GET /groupings/new
  # GET /groupings/new.xml
  def new
    @grouping = Grouping.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grouping }
    end
  end

  # GET /groupings/1/edit
  def edit
    @grouping = Grouping.find(params[:id])
  end

  # POST /groupings
  # POST /groupings.xml
  def create
    @grouping = Grouping.new(params[:grouping])

    respond_to do |format|
      if @grouping.save
        format.html { redirect_to(@grouping, :notice => 'Grouping was successfully created.') }
        format.xml  { render :xml => @grouping, :status => :created, :location => @grouping }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @grouping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groupings/1
  # PUT /groupings/1.xml
  def update
    @grouping = Grouping.find(params[:id])

    respond_to do |format|
      if @grouping.update_attributes(params[:grouping])
        format.html { redirect_to(@grouping, :notice => 'Grouping was successfully updated.') }
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
    @grouping = Grouping.find(params[:id])
    @grouping.destroy

    respond_to do |format|
      format.html { redirect_to(groupings_url) }
      format.xml  { head :ok }
    end
  end
end
