class SectorsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_sector, only: [:edit, :update, :show, :destroy]

  def index
    @sectors = Sector.all
  end

  def show
  end

  def new
    @sector = Sector.new
  end

  def create
    @sector = Sector.new(sector_params)
    if @sector.save
      flash[:notice] = "Sector created successfully"
      redirect_to sectors_path
    else
      flash[:alert] = @sector.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @sector.update(sector_params)
      flash[:notice] = "Sector updated successfully"
      redirect_to sector_path
    else
      flash[:alert] = @sector.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def users
    sector = Sector.find(params[:id])
    users = sector.users.where(role: 0)
    render json: users
  end

  def destroy
    @sector.destroy
    flash[:notice] = "Sector destroyed successfully"
    redirect_to sectors_path
  end

  private

  def sector_params
    params.expect(sector: [:name, :unit_id])
  end

  def set_sector
    @sector = Sector.find(params[:id])
  end
end
