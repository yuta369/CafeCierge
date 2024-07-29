class Admin::CafesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_cafe, only: [:show, :edit, :update, :destroy]

  def index
    @cafes = Cafe.all
  end

  def show; end

  def new
    @cafe = Cafe.new
  end

  def edit; end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      redirect_to admin_cafe_path(@cafe), notice: 'Cafe was successfully created.'
    else
      render :new
    end
  end

  def update
    if @cafe.update(cafe_params)
      redirect_to admin_cafe_path(@cafe), notice: 'Cafe was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cafe.destroy
    redirect_to admin_cafes_path, notice: 'Cafe was successfully destroyed.'
  end

  private

  def set_cafe
    @cafe = Cafe.find(params[:id])
  end

  def cafe_params
    params.require(:cafe).permit(:name, :address, :contact_info, :hours, :category, :price_range, :features, :image)
  end
end
