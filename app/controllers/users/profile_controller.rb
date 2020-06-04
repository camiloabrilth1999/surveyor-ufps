class Users::ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def load_user
    @user = User.find_by(uuid: params[:uuid])
  end

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :document_number, :contact_number,
      :identification_type_id, :password, :password_confirmation)
  end
end
