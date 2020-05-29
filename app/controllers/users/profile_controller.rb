class Users::ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, except: [:index]

  def index
    @users = User.all
  end

  def show
  end

  private

  def load_user
    @user = current_user
  end
end
