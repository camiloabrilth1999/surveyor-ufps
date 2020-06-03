class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user

  def show
  end

  private

  def load_user
    @user = User.find_by(uuid: params[:uuid])
  end
end
