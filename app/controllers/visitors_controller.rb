class VisitorsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_visitor, only: [:edit, :update, :show, :destroy]

  def index
    @visitors = Visitor.all
  end

  def show
  end

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(visitor_params)
    if @visitor.save
      redirect_to visitors_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @visitor.update(visitor_params)
      redirect_to visitors_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @visitor.destroy
    redirect_to visitors_path
  end

  private

  def visitor_params
    params.expect(visitor: [ :name, :rg, :cpf, :telephone, :photo ])
  end

  def set_visitor
    @visitor = Visitor.find(params[:id])
  end

end
