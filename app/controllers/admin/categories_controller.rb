class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:edit, :update]
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
      flash.now[:error] = 'Category save failed.'
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
      flash.now[:error] = 'Category update failed.'
      render :edit
    end
  end

  protected
  def category_params
    params.require(:category).permit(:name, :image)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
