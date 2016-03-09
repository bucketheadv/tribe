class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  def index
    @articles = Article.query(params).published.page(params[:page] || 1)
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
