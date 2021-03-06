class MunicipesController < ApplicationController
  before_action :set_municipe, only: [:show, :update]

  # GET /municipes
  def index
    @municipes = Municipe.page(params[:page] || 1).per(params[:per_page] || 100)
    @totalMunicipes = Municipe.count

    render json: { items: ActiveModelSerializers::SerializableResource.new(@municipes, each_serializer: MunicipeSerializer), totalCount: @totalMunicipes }
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
      params.require(:municipe).permit(:nome_completo, :cpf, :email, :telefone, :foto, :status, :data_nascimento, :address, address_attributes: [:cep,:logradouro,:complemento,:bairro,:cidade,:uf,:ibge])
    end
end

