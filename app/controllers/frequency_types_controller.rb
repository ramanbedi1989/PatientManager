class FrequencyTypesController < ApplicationController
  # GET /frequency_types
  # GET /frequency_types.json
  def index
    @frequency_types = FrequencyType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frequency_types }
    end
  end

  # GET /frequency_types/1
  # GET /frequency_types/1.json
  def show
    @frequency_type = FrequencyType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @frequency_type }
    end
  end

  # GET /frequency_types/new
  # GET /frequency_types/new.json
  def new
    @frequency_type = FrequencyType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @frequency_type }
    end
  end

  # GET /frequency_types/1/edit
  def edit
    @frequency_type = FrequencyType.find(params[:id])
  end

  # POST /frequency_types
  # POST /frequency_types.json
  def create
    @frequency_type = FrequencyType.new(params[:frequency_type])

    respond_to do |format|
      if @frequency_type.save
        format.html { redirect_to @frequency_type, notice: 'Frequency type was successfully created.' }
        format.json { render json: @frequency_type, status: :created, location: @frequency_type }
      else
        format.html { render action: "new" }
        format.json { render json: @frequency_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /frequency_types/1
  # PUT /frequency_types/1.json
  def update
    @frequency_type = FrequencyType.find(params[:id])

    respond_to do |format|
      if @frequency_type.update_attributes(params[:frequency_type])
        format.html { redirect_to @frequency_type, notice: 'Frequency type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @frequency_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frequency_types/1
  # DELETE /frequency_types/1.json
  def destroy
    @frequency_type = FrequencyType.find(params[:id])
    @frequency_type.destroy

    respond_to do |format|
      format.html { redirect_to frequency_types_url }
      format.json { head :no_content }
    end
  end
end
