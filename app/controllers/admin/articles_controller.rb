class Admin::ArticlesController < AdminController
  before_action :set_article, only: [:edit, :update, :destroy]
  def index
    @articles = Article.query(params).page(params[:page] || 1)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article saved."
      redirect_to action: :index
    else
      flash.now[:error] = "Article save failed."
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = "Article Updated."
      redirect_to action: :index
    else
      flash.now[:error] = "Article save failed."
      render :edit
    end
  end

  def destroy
  end

  protected
  def article_params
    params.require(:article).permit(:title, :body, :category_id, :published, :tag_list)
  end
  def set_article
    @article = Article.find(params[:id])
  end
end
