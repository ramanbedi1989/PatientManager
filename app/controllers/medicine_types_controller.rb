class MedicineTypesController < ApplicationController
  # GET /medicine_types
  # GET /medicine_types.json
  def index
    @medicine_types = MedicineType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medicine_types }
    end
  end

  # GET /medicine_types/1
  # GET /medicine_types/1.json
  def show
    @medicine_type = MedicineType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medicine_type }
    end
  end

  # GET /medicine_types/new
  # GET /medicine_types/new.json
  def new
    @medicine_type = MedicineType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medicine_type }
    end
  end

  # GET /medicine_types/1/edit
  def edit
    @medicine_type = MedicineType.find(params[:id])
  end

  # POST /medicine_types
  # POST /medicine_types.json
  def create
    @medicine_type = MedicineType.new(params[:medicine_type])

    respond_to do |format|
      if @medicine_type.save
        format.html { redirect_to @medicine_type, notice: 'Medicine type was successfully created.' }
        format.json { render json: @medicine_type, status: :created, location: @medicine_type }
      else
        format.html { render action: "new" }
        format.json { render json: @medicine_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medicine_types/1
  # PUT /medicine_types/1.json
  def update
    @medicine_type = MedicineType.find(params[:id])

    respond_to do |format|
      if @medicine_type.update_attributes(params[:medicine_type])
        format.html { redirect_to @medicine_type, notice: 'Medicine type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medicine_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicine_types/1
  # DELETE /medicine_types/1.json
  def destroy
    @medicine_type = MedicineType.find(params[:id])
    @medicine_type.destroy

    respond_to do |format|
      format.html { redirect_to medicine_types_url }
      format.json { head :no_content }
    end
  end
end
