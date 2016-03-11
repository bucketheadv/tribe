class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_404
    render 'errors/404'
  end

  def locale
    locale = params[:locale]
    I18n.locale = locale.to_sym
    redirect_to :back
  rescue => e
    p e
    redirect_to :back
  end
end
