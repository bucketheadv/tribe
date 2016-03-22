class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:edit, :update, :destroy]
  def index
    @categories = Category.page(params[:page] || 1)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category saved.'
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = 'Category updated.'
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'Category destroyed.'
    redirect_to action: :index
  end

  protected
  def category_params
    params.require(:category).permit(:name, :image)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
