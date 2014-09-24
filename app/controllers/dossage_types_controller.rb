class DossageTypesController < ApplicationController
  # GET /dossage_types
  # GET /dossage_types.json
  def index
    @dossage_types = DossageType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dossage_types }
    end
  end

  # GET /dossage_types/1
  # GET /dossage_types/1.json
  def show
    @dossage_type = DossageType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dossage_type }
    end
  end

  # GET /dossage_types/new
  # GET /dossage_types/new.json
  def new
    @dossage_type = DossageType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dossage_type }
    end
  end

  # GET /dossage_types/1/edit
  def edit
    @dossage_type = DossageType.find(params[:id])
  end

  # POST /dossage_types
  # POST /dossage_types.json
  def create
    @dossage_type = DossageType.new(params[:dossage_type])

    respond_to do |format|
      if @dossage_type.save
        format.html { redirect_to @dossage_type, notice: 'Dossage type was successfully created.' }
        format.json { render json: @dossage_type, status: :created, location: @dossage_type }
      else
        format.html { render action: "new" }
        format.json { render json: @dossage_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dossage_types/1
  # PUT /dossage_types/1.json
  def update
    @dossage_type = DossageType.find(params[:id])

    respond_to do |format|
      if @dossage_type.update_attributes(params[:dossage_type])
        format.html { redirect_to @dossage_type, notice: 'Dossage type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dossage_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dossage_types/1
  # DELETE /dossage_types/1.json
  def destroy
    @dossage_type = DossageType.find(params[:id])
    @dossage_type.destroy

    respond_to do |format|
      format.html { redirect_to dossage_types_url }
      format.json { head :no_content }
    end
  end
end
