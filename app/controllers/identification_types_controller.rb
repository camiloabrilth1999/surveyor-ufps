class IdentificationTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_identification_type, only: [:show, :edit, :update, :destroy]

  # GET /identification_types
  # GET /identification_types.json
  def index
    @identification_types = IdentificationType.all
  end

  # GET /identification_types/1
  # GET /identification_types/1.json
  def show
  end

  # GET /identification_types/new
  def new
    @identification_type = IdentificationType.new
  end

  # GET /identification_types/1/edit
  def edit
  end

  # POST /identification_types
  # POST /identification_types.json
  def create
    @identification_type = IdentificationType.new(identification_type_params)

    respond_to do |format|
      if @identification_type.save
        format.html { redirect_to @identification_type, notice: 'Identification type was successfully created.' }
        format.json { render :show, status: :created, location: @identification_type }
      else
        format.html { render :new }
        format.json { render json: @identification_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /identification_types/1
  # PATCH/PUT /identification_types/1.json
  def update
    respond_to do |format|
      if @identification_type.update(identification_type_params)
        format.html { redirect_to @identification_type, notice: 'Identification type was successfully updated.' }
        format.json { render :show, status: :ok, location: @identification_type }
      else
        format.html { render :edit }
        format.json { render json: @identification_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /identification_types/1
  # DELETE /identification_types/1.json
  def destroy
    @identification_type.destroy
    respond_to do |format|
      format.html { redirect_to identification_types_url, notice: 'Identification type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_identification_type
      @identification_type = IdentificationType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def identification_type_params
      params.require(:identification_type).permit(:description, :summary_description)
    end
end
