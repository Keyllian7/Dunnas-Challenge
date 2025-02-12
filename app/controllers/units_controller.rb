class UnitsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @units = Unit.all
  end
  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      redirect_to units_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def unit_params
    params.expect(unit: [ :name, :email ])
  end
end
