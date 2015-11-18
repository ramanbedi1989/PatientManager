class MedicalCampsController < ApplicationController
  skip_before_filter :check_medical_camp
  # GET /medical_camps
  # GET /medical_camps.json
  def index
    @medical_camps = MedicalCamp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medical_camps }
    end
  end

  # GET /medical_camps/1
  # GET /medical_camps/1.json
  def show
    @medical_camp = MedicalCamp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medical_camp }
    end
  end

  # GET /medical_camps/new
  # GET /medical_camps/new.json
  def new
    @medical_camp = MedicalCamp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medical_camp }
    end
  end

  # GET /medical_camps/1/edit
  def edit
    @medical_camp = MedicalCamp.find(params[:id])
  end

  # POST /medical_camps
  # POST /medical_camps.json
  def create
    @medical_camp = MedicalCamp.new(params[:medical_camp])

    respond_to do |format|
      if @medical_camp.save
        format.html { redirect_to @medical_camp, notice: 'Medical camp was successfully created.' }
        format.json { render json: @medical_camp, status: :created, location: @medical_camp }
      else
        format.html { render action: "new" }
        format.json { render json: @medical_camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medical_camps/1
  # PUT /medical_camps/1.json
  def update
    @medical_camp = MedicalCamp.find(params[:id])

    respond_to do |format|
      if @medical_camp.update_attributes(params[:medical_camp])
        format.html { redirect_to @medical_camp, notice: 'Medical camp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medical_camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_camps/1
  # DELETE /medical_camps/1.json
  def destroy
    @medical_camp = MedicalCamp.find(params[:id])
    @medical_camp.destroy

    respond_to do |format|
      format.html { redirect_to medical_camps_url }
      format.json { head :no_content }
    end
  end
end
