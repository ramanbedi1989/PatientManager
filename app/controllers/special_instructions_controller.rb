class SpecialInstructionsController < ApplicationController
  # GET /special_instructions
  # GET /special_instructions.json
  def index
    @special_instructions = SpecialInstruction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @special_instructions }
    end
  end

  # GET /special_instructions/1
  # GET /special_instructions/1.json
  def show
    @special_instruction = SpecialInstruction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @special_instruction }
    end
  end

  # GET /special_instructions/new
  # GET /special_instructions/new.json
  def new
    @special_instruction = SpecialInstruction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @special_instruction }
    end
  end

  # GET /special_instructions/1/edit
  def edit
    @special_instruction = SpecialInstruction.find(params[:id])
  end

  # POST /special_instructions
  # POST /special_instructions.json
  def create
    @special_instruction = SpecialInstruction.new(params[:special_instruction])

    respond_to do |format|
      if @special_instruction.save
        format.html { redirect_to @special_instruction, notice: 'Special instruction was successfully created.' }
        format.json { render json: @special_instruction, status: :created, location: @special_instruction }
      else
        format.html { render action: "new" }
        format.json { render json: @special_instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /special_instructions/1
  # PUT /special_instructions/1.json
  def update
    @special_instruction = SpecialInstruction.find(params[:id])

    respond_to do |format|
      if @special_instruction.update_attributes(params[:special_instruction])
        format.html { redirect_to @special_instruction, notice: 'Special instruction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @special_instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /special_instructions/1
  # DELETE /special_instructions/1.json
  def destroy
    @special_instruction = SpecialInstruction.find(params[:id])
    @special_instruction.destroy

    respond_to do |format|
      format.html { redirect_to special_instructions_url }
      format.json { head :no_content }
    end
  end
end
