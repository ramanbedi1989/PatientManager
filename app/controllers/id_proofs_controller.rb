class IdProofsController < ApplicationController
  # GET /id_proofs
  # GET /id_proofs.json
  def index
    @id_proofs = IdProof.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @id_proofs }
    end
  end

  # GET /id_proofs/1
  # GET /id_proofs/1.json
  def show
    @id_proof = IdProof.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @id_proof }
    end
  end

  # GET /id_proofs/new
  # GET /id_proofs/new.json
  def new
    @id_proof = IdProof.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @id_proof }
    end
  end

  # GET /id_proofs/1/edit
  def edit
    @id_proof = IdProof.find(params[:id])
  end

  # POST /id_proofs
  # POST /id_proofs.json
  def create
    @id_proof = IdProof.new(params[:id_proof])

    respond_to do |format|
      if @id_proof.save
        format.html { redirect_to @id_proof, notice: 'Id proof was successfully created.' }
        format.json { render json: @id_proof, status: :created, location: @id_proof }
      else
        format.html { render action: "new" }
        format.json { render json: @id_proof.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /id_proofs/1
  # PUT /id_proofs/1.json
  def update
    @id_proof = IdProof.find(params[:id])

    respond_to do |format|
      if @id_proof.update_attributes(params[:id_proof])
        format.html { redirect_to @id_proof, notice: 'Id proof was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @id_proof.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /id_proofs/1
  # DELETE /id_proofs/1.json
  def destroy
    @id_proof = IdProof.find(params[:id])
    @id_proof.destroy

    respond_to do |format|
      format.html { redirect_to id_proofs_url }
      format.json { head :no_content }
    end
  end
end
