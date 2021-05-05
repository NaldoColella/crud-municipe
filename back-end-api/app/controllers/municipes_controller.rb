class MunicipesController < ApplicationController
  before_action :set_municipe, only: [:show, :update]

  # GET /municipes
  def index
    @municipes = checkPaginateParams(params) ? getPaginatedResults(params) : getAllResults()
    @totalMunicipes = Municipe.count;

    render json: { items: serializeMunicipes(@municipes), totalCount: @totalMunicipes }
  end

  # GET /municipes/1
  def show
    render json: @municipe
  end

  # POST /municipes
  def create
    @municipe = Municipe.new(municipe_params)

    if @municipe.save
      render json: @municipe, status: :created, location: @municipe
    else
      render json: @municipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /municipes/1
  def update
    if @municipe.update(municipe_params)
      render json: @municipe
    else
      render json: @municipe.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipe
      @municipe = Municipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def municipe_params
      params.require(:municipe).permit(:full_name, :cpf, :mail, :phone, :photo, :status, :dta_nasc, :address, address_attributes: [:cep,:logradouro,:complemento,:bairro,:cidade,:uf,:ibge])
    end
    
    def checkPaginateParams(params)
      params[:page].present? && params[:per_page].present?
    end
  
    def getPaginatedResults(params)
      Municipe.page(params[:page]).per(params[:per_page])
    end
  
    def getAllResults
      Municipe.all
    end
  
    def serializeMunicipes(items) 
      items.map{ |item| MunicipeSerializer.new(item) }
    end
end

