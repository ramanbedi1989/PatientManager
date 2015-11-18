class MedicinePatientRelationshipsController < ApplicationController
  # GET /medicine_patient_relationships
  # GET /medicine_patient_relationships.json
  def index
    @medicine_patient_relationships = MedicinePatientRelationship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medicine_patient_relationships }
    end
  end

  # GET /medicine_patient_relationships/1
  # GET /medicine_patient_relationships/1.json
  def show
    @medicine_patient_relationship = MedicinePatientRelationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medicine_patient_relationship }
    end
  end

  # GET /medicine_patient_relationships/new
  # GET /medicine_patient_relationships/new.json
  def new
    @medicine_patient_relationship = MedicinePatientRelationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medicine_patient_relationship }
    end
  end

  # GET /medicine_patient_relationships/1/edit
  def edit
    @medicine_patient_relationship = MedicinePatientRelationship.find(params[:id])
  end

  # POST /medicine_patient_relationships
  # POST /medicine_patient_relationships.json
  def create
    @medicine_patient_relationship = MedicinePatientRelationship.new(params[:medicine_patient_relationship])

    respond_to do |format|
      if @medicine_patient_relationship.save
        format.html { redirect_to @medicine_patient_relationship, notice: 'Medicine patient relationship was successfully created.' }
        format.json { render json: @medicine_patient_relationship, status: :created, location: @medicine_patient_relationship }
      else
        format.html { render action: "new" }
        format.json { render json: @medicine_patient_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medicine_patient_relationships/1
  # PUT /medicine_patient_relationships/1.json
  def update
    @medicine_patient_relationship = MedicinePatientRelationship.find(params[:id])

    respond_to do |format|
      if @medicine_patient_relationship.update_attributes(params[:medicine_patient_relationship])
        format.html { redirect_to @medicine_patient_relationship, notice: 'Medicine patient relationship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medicine_patient_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicine_patient_relationships/1
  # DELETE /medicine_patient_relationships/1.json
  def destroy
    @medicine_patient_relationship = MedicinePatientRelationship.find(params[:id])
    @medicine_patient_relationship.destroy

    respond_to do |format|
      format.html { redirect_to medicine_patient_relationships_url }
      format.json { head :no_content }
    end
  end
end
