class UnitsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_unit, only: [:edit, :update, :show, :destroy]

  def index
    @units = Unit.all
  end

  def show
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      redirect_to units_path
    else
      flash[:alert] = @unit.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @unit.update(unit_params)
      redirect_to units_path
    else
      flash[:alert] = @unit.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @unit.destroy
    redirect_to units_path
  end

  def sectors
    unit = Unit.find(params[:id])
    sectors = unit.sectors
    render json: sectors
  end

  private

  def unit_params
    params.expect(unit: [:name, :email])
  end

  def set_unit
    @unit = Unit.find(params[:id])
  end
end
