class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :favorite]
  
  def index
<<<<<<< HEAD
    if sort_params.present?
      @category = Category.request_category(sort_params[:sort_category])
      @products = Product.sort_products(sort_params, params[:page])
    elsif params[:category].present?
      @category = Category.request_category(params[:category])
      @products = Product.category_products(@category, params[:page])
    else
      @products = Product.display_list(params[:page])
    end
    
=======
    @products = Product.all
  end

  def show
    @reviews = @product.reviews
    @review = @reviews.new
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_url @product
  end

  def edit
>>>>>>> df59727a03a4525b5fc2d12d454cc1ffe9d5b80e
    @categories = Category.all
    @major_category_names = Category.major_categories
    @sort_list = Product.sort_list
  end

  def show
    @reviews = @product.reviews_with_id
    @review = @reviews.new
    @star_repeat_select = Review.star_repeat_select
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end
  
  def favorite
    current_user.toggle_like!(@product)
    redirect_to product_url @product
  end
  
  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id)
    end
    
    def set_product
      @product = Product.find(params[:id])
    end
    
    def sort_params
      params.permit(:sort, :sort_category)
    end
end
