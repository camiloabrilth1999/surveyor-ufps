# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  layout "public"
  protected

  def after_resetting_password_path_for(_resource)
    unauthenticated_root_path
  end
end
