require 'active_support/deprecation'

class Clearance::PasswordsController < Clearance::BaseController
  skip_before_filter :require_login, only: [:create, :edit, :new, :update]
  skip_before_filter :authorize, only: [:create, :edit, :new, :update]
  before_filter :ensure_existing_user, only: [:edit, :update]

  def create
    if user = find_user_for_create
      user.forgot_password!
      deliver_email(user)
    end
    render template: 'passwords/create'
  end

  def edit
    @user = find_user_for_edit
    render template: 'passwords/edit'
  end
end