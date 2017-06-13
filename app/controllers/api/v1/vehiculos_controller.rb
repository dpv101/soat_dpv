class Api::V1::VehiculosController < ApplicationController
  before_action :set_vehiculo, only: [:show, :edit, :update, :destroy]

  respond_to :json
  # GET /users.json
  def index
    @vehiculos = Vehiculo.all
    render json: @vehiculos
  end

  def create
    @vehiculo = Vechiculo.new(vehiculo_params)
    if @vehiculo.save
      respond_with({status: :ok})
    else
      respond_with({status: :ok, errors:@vehiculo.errors})
    end
  end

  def create
    if @vehiculo.update(vehiculo_params)
      respond_with({status: :ok})
    else
      respond_with({status: :ok, errors:@vehiculo.errors})
    end
  end

  def destroy
    if @vehiculo.destroy
      respond_with({status: :ok})
    else
      respond_with({status: :ok, errors:@vehiculo.errors})
    end

  end

  private
    def vehiculo_params
      params.require(:vehiculo).permit(:placa, :edad, :numero_pasajeros, :cilindraje, :peso)
    end

    def set_vehiculo
      @vehiculo = Vehiculo.find(params[:id])
    end

end
