class UnitsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [ :index ]

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
