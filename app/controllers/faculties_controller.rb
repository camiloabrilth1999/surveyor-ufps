class FacultiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]

  # GET /faculties
  # GET /faculties.json
  def index
    @faculties = Faculty.all
    authorize @faculties
  end

  # GET /faculties/1
  # GET /faculties/1.json
  def show
    authorize @faculty
  end

  # GET /faculties/new
  def new
    @faculty = Faculty.new
    authorize @faculty
  end

  # GET /faculties/1/edit
  def edit
    authorize @faculty
  end

  # POST /faculties
  # POST /faculties.json
  def create
    @faculty = Faculty.new(faculty_params)
    authorize @faculty

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to @faculty, notice: 'La facultad ha sido creada correctamente.' }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1
  # PATCH/PUT /faculties/1.json
  def update
    respond_to do |format|
      authorize @faculty
      if @faculty.update(faculty_params)
        format.html { redirect_to @faculty, notice: 'Se ha actualizado la facultad correctamente.' }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculties/1
  # DELETE /faculties/1.json
  def destroy
    authorize @faculty
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to faculties_url, notice: 'Se ha eliminado la facultad correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def faculty_params
      params.require(:faculty).permit(:name, :code)
    end
end
