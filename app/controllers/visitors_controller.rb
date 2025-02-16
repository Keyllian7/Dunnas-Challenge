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

  def verify_by_cpf

    @visitor = Visitor.new(visitor_params)

    if @visitor.cpf.blank?
      flash.now[:alert] = 'Please provide a valid CPF'
      render :new, status: :unprocessable_entity
      return
    end
  
    unless BRDocuments::CPF.valid?(@visitor.cpf)
      flash.now[:alert] = 'Invalid CPF'
      render :new, status: :unprocessable_entity
      return
    end
  
    cpf_clean = @visitor.cpf.gsub(/\D/, '')
    visitor_exist = Visitor.find_by(cpf: cpf_clean)
  
    if visitor_exist.present?
      flash[:alert] = 'Visitor already exists'
      redirect_to visitor_path(visitor_exist)
      return
    end

    flash[:cpf_data] = @visitor.cpf
    flash[:show_form] = true
    redirect_to new_visitor_path
  end

  def create
    @visitor = Visitor.new(visitor_params)
    
    if @visitor.save
      flash[:notice] = 'Visitor created successfully'
      redirect_to visitors_path
    else
      flash[:alert] = @visitor.errors.full_messages.to_sentence
      flash[:cpf_data] = @visitor.cpf
      flash[:show_form] = true
      render :new, status: :unprocessable_entity
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
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @visitor.destroy
    flash[:notice] = 'Visitor deleted successfully'
    redirect_to visitors_path
  end

  private

  def visitor_params
    params.require(:visitor).permit(:name, :rg, :cpf, :telephone, :photo)
  end

  def set_visitor
    @visitor = Visitor.find(params[:id])
  end
end
