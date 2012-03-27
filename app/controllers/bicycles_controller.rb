class BicyclesController < ApplicationController
  # GET /bicycles
  # GET /bicycles.json
  def index
    @bicycles = Bicycle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bicycles }
    end
  end

  # GET /bicycles/1
  # GET /bicycles/1.json
  def show
    @bicycle = Bicycle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bicycle }
    end
  end

  # GET /bicycles/new
  # GET /bicycles/new.json
  def new
    @bicycle = Bicycle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bicycle }
    end
  end

  # GET /bicycles/1/edit
  def edit
    @bicycle = Bicycle.find(params[:id])
  end

  # POST /bicycles
  # POST /bicycles.json
  def create
    @bicycle = Bicycle.new(params[:bicycle])

    respond_to do |format|
      if @bicycle.save
        format.html { redirect_to @bicycle, notice: 'Bicycle was successfully created.' }
        format.json { render json: @bicycle, status: :created, location: @bicycle }
      else
        format.html { render action: "new" }
        format.json { render json: @bicycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bicycles/1
  # PUT /bicycles/1.json
  def update
    @bicycle = Bicycle.find(params[:id])

    respond_to do |format|
      if @bicycle.update_attributes(params[:bicycle])
        format.html { redirect_to @bicycle, notice: 'Bicycle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bicycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bicycles/1
  # DELETE /bicycles/1.json
  def destroy
    @bicycle = Bicycle.find(params[:id])
    @bicycle.destroy

    respond_to do |format|
      format.html { redirect_to bicycles_url }
      format.json { head :no_content }
    end
  end
end
