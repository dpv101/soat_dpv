class ClaseVehiculosController < ApplicationController
  before_action :set_clase_vehiculo, only: [:show, :edit, :update, :destroy, :get_tipo_vehiculos]

  # GET /clase_vehiculos
  # GET /clase_vehiculos.json
  def index
    @clase_vehiculos = ClaseVehiculo.all
  end

  # GET /clase_vehiculos/1
  # GET /clase_vehiculos/1.json
  def show
  end

  # GET /clase_vehiculos/new
  def new
    @clase_vehiculo = ClaseVehiculo.new
  end

  # GET /clase_vehiculos/1/edit
  def edit
  end

  # POST /clase_vehiculos
  # POST /clase_vehiculos.json
  def create
    @clase_vehiculo = ClaseVehiculo.new(clase_vehiculo_params)

    respond_to do |format|
      if @clase_vehiculo.save
        format.html { redirect_to @clase_vehiculo, notice: 'Clase vehiculo was successfully created.' }
        format.json { render :show, status: :created, location: @clase_vehiculo }
      else
        format.html { render :new }
        format.json { render json: @clase_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clase_vehiculos/1
  # PATCH/PUT /clase_vehiculos/1.json
  def update
    respond_to do |format|
      if @clase_vehiculo.update(clase_vehiculo_params)
        format.html { redirect_to @clase_vehiculo, notice: 'Clase vehiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @clase_vehiculo }
      else
        format.html { render :edit }
        format.json { render json: @clase_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clase_vehiculos/1
  # DELETE /clase_vehiculos/1.json
  def destroy
    @clase_vehiculo.destroy
    respond_to do |format|
      format.html { redirect_to clase_vehiculos_url, notice: 'Clase vehiculo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_tipo_vehiculos
    render json: @clase_vehiculo.tipo_vehiculos.to_a
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clase_vehiculo
      @clase_vehiculo = ClaseVehiculo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clase_vehiculo_params
      params.require(:clase_vehiculo).permit(:nombre)
    end
end
