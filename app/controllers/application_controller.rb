class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def render_404
    render 'errors/404'
  end

  def locale
    locale = params[:locale]
    session[:locale] = locale if locale
    redirect_to :back
  rescue => _
    redirect_to :back
  end

  protected
  def set_locale
    I18n.locale = session[:locale]
  end
end
