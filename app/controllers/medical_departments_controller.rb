class MedicalDepartmentsController < ApplicationController
  # GET /medical_departments
  # GET /medical_departments.json
  def index
    @medical_departments = MedicalDepartment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medical_departments }
    end
  end

  # GET /medical_departments/1
  # GET /medical_departments/1.json
  def show
    @medical_department = MedicalDepartment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medical_department }
    end
  end

  # GET /medical_departments/new
  # GET /medical_departments/new.json
  def new
    @medical_department = MedicalDepartment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medical_department }
    end
  end

  # GET /medical_departments/1/edit
  def edit
    @medical_department = MedicalDepartment.find(params[:id])
  end

  # POST /medical_departments
  # POST /medical_departments.json
  def create
    @medical_department = MedicalDepartment.new(params[:medical_department])

    respond_to do |format|
      if @medical_department.save
        format.html { redirect_to @medical_department, notice: 'Medical department was successfully created.' }
        format.json { render json: @medical_department, status: :created, location: @medical_department }
      else
        format.html { render action: "new" }
        format.json { render json: @medical_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medical_departments/1
  # PUT /medical_departments/1.json
  def update
    @medical_department = MedicalDepartment.find(params[:id])

    respond_to do |format|
      if @medical_department.update_attributes(params[:medical_department])
        format.html { redirect_to @medical_department, notice: 'Medical department was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medical_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_departments/1
  # DELETE /medical_departments/1.json
  def destroy
    @medical_department = MedicalDepartment.find(params[:id])
    @medical_department.destroy

    respond_to do |format|
      format.html { redirect_to medical_departments_url }
      format.json { head :no_content }
    end
  end
end
