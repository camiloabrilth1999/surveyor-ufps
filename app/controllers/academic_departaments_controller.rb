class AcademicDepartamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_academic_departament, only: [:show, :edit, :update, :destroy]

  # GET /academic_departaments
  # GET /academic_departaments.json
  def index
    @academic_departaments = AcademicDepartament.all
  end

  # GET /academic_departaments/1
  # GET /academic_departaments/1.json
  def show
  end

  # GET /academic_departaments/new
  def new
    @academic_departament = AcademicDepartament.new
  end

  # GET /academic_departaments/1/edit
  def edit
  end

  # POST /academic_departaments
  # POST /academic_departaments.json
  def create
    @academic_departament = AcademicDepartament.new(academic_departament_params)

    respond_to do |format|
      if @academic_departament.save
        format.html { redirect_to @academic_departament, notice: 'El departamento academico ha sido creado correctamente.' }
        format.json { render :show, status: :created, location: @academic_departament }
      else
        format.html { render :new }
        format.json { render json: @academic_departament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_departaments/1
  # PATCH/PUT /academic_departaments/1.json
  def update
    respond_to do |format|
      if @academic_departament.update(academic_departament_params)
        format.html { redirect_to @academic_departament, notice: 'Se ha actualizado el departamento academico correctamente.' }
        format.json { render :show, status: :ok, location: @academic_departament }
      else
        format.html { render :edit }
        format.json { render json: @academic_departament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_departaments/1
  # DELETE /academic_departaments/1.json
  def destroy
    @academic_departament.destroy
    respond_to do |format|
      format.html { redirect_to academic_departaments_url, notice: 'Se ha eliminado el departamento academico correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_departament
      @academic_departament = AcademicDepartament.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def academic_departament_params
      params.require(:academic_departament).permit(:name, :code)
    end
end
