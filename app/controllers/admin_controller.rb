class AdminController < ApplicationController
  layout 'admin/application'
  before_action :check_authority

  protected
  def check_authority
    redirect_to new_user_session_path unless current_user
  end
end
