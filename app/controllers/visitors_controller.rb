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
      flash[:notice] = 'Visitor created successfully'
      redirect_to visitors_path
    else
      flash[:alert] = @visitor.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @visitor.update(visitor_params)
      flash[:notice] = 'Visitor edited successfully'
      redirect_to visitors_path
    else
      flash[:alert] = @visitor.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @visitor.destroy
    flash[:notice] = 'Visitor deleted successfully'
    redirect_to visitors_path
  end

  private

  def visitor_params
    params.expect(visitor: [:name, :rg, :cpf, :telephone, :photo])
  end

  def set_visitor
    @visitor = Visitor.find(params[:id])
  end
end
