class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  def index
    @articles = Article.query(params).page(params[:page] || 1)
    respond_to do |format|
      format.html
    end
  end

  def show
  end

  protected
  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound => _
    render_404
  end
end
