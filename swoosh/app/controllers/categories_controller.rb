class CategoriesController < ApplicationController

  before_action :ensure_current_user_is_owner, :only => [:show, :edit, :update, :destroy]

  def ensure_current_user_is_owner

    @categories = Category.find(params[:id])

    if @categories.user_id != current_user.id
      redirect_to root_url, :alert => "You are not authorized for that."
    end

  end

  def index
    # @categories = Category.all
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.task_id = params[:task_id]
    @category.name = params[:name]
    @category.user_id = current_user.id

    if @category.save
      redirect_to "/categories", :notice => "Category created successfully."
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.task_id = params[:task_id]
    @category.name = params[:name]
    @category.user_id = current_user.id

    if @category.save
      redirect_to "/categories", :notice => "Category updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy

    redirect_to "/categories", :notice => "Category deleted."
  end
end
