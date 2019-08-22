class ItemsController < ApplicationController
  before_action :set_department
  before_action :set_item, only: [:show, :edit, :update, :destroy]
 
  def index
    @items = @department.items 
  end

  def show
  end

  def new
    @items = @department.items.new
    render partial: "form"
  end

  def create
    @items = @department.items.new(item_params)

    if @items.save
      redirect_to department_items_path(@department)
    else
      render :new
    end
  end


  def update

    if @items.update(item_params)
      redirect_to department_item_path(@department, @items)
    else
      render :edit
    end
  end


  def edit
    render partial: 'form'
  end



  def destroy

    @items.destroy
    redirect_to department_items_path(@department)
  end



  private 
  def set_department
    @department = Department.find(params[:department_id])
  end

  def set_item
    @items = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price)
  end


end
