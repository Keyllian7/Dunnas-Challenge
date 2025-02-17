class VisitsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_visit, only: [:show]

  def index
  end

  def show
  end

  def new
    @visit = Visit.new
  end

  def edit
  end

  def update
    if @visit.update(visit_params)
      flash[:notice] = "Visit updated successfully"
      redirect_to visit_path
    else
      flash[:alert] = @visit.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @visit.destroy
    flash[:notice] = "Visitor destroyed successfully"
    redirect_to visits_path
  end

  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      flash[:notice] = "Visit created successfully"
      redirect_to visits_path
    else
      flash[:alert] = @visit.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def visit_params
    params.expect(visit: [:visitor_id, :unit_id, :sector_id, :user_id, :date_time, :status])
  end

  def set_visit
    @visit = Visit.find(params[:id])
  end
end
