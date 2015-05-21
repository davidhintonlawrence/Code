class CategoriesController < ApplicationController
  def index
    @categories = Category.all
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
