class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.with_role :director_de_programa
    authorize @users
  end

  def show
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def edit
    authorize @user
  end

  def create
    @user = User.new(user_params)
    user_modify
    authorize @user

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Se ha actualizado el usuario correctamente.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      authorize @user
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Se ha actualizado el usuario correctamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Se ha eliminado el usuario correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find_by(uuid: params[:uuid])
    end

    def user_params
      params.require(:user).permit(:name, :lastname, :code, :email, :document_number, :contact_number,
        :identification_type_id, :academic_departament_id, :academic_program_id, :password, :password_confirmation)
    end

    def user_modify
      @user.update(password: "#{@user.document_number}"+"UFPS"+"#{@user.code}",
        password_confirmation: "#{@user.document_number}"+"UFPS"+"#{@user.code}")
      @user.add_role :director_de_programa
    end
end
