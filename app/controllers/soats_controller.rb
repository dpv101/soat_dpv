class SoatsController < ApplicationController
  before_action :set_soat, only: [:show, :edit, :update, :destroy]

  # GET /soats
  # GET /soats.json
  def index
    @soats = Soat.all
  end

  # GET /soats/1
  # GET /soats/1.json
  def show
    respond_to do |format|
      format.html{}
      format.pdf {render pdf: "file_name", encoding: "UTF-8" }
    end
  end

  # GET /soats/new
  def new
    @soat = Soat.new
    @cliente = Cliente.new
    @vehiculo = Vehiculo.new
  end

  # GET /soats/1/edit
  def edit
  end

  # POST /soats
  # POST /soats.json
  def create
    respond_to do |format|
      #CREANDO CLIENTE
      c_params = cliente_params
      @cliente = Cliente.find_by_numero_documento(c_params[:numero_documento])
      if !@cliente
        @cliente = Cliente.new(c_params)
      end
      v_params = vehiculo_params
      @vehiculo = Vehiculo.find_by_placa(v_params[:placa])
      if !@vehiculo
        @vehiculo = Vehiculo.new(v_params)
      end

      @vehiculo.tipo_vehiculo_id = v_params[:tipo_vehiculo_id]
      @vehiculo.clase_vehiculo_id = v_params[:clase_vehiculo_id]

      if params[:fecha_vecimiento].to_datetime > DateTime.now.strftime("%Y/%mm/%dd").to_datetime
        if @cliente.save
          if @vehiculo.save
            venta = Venta.new
            venta.cliente_id = @cliente.id
            venta.vehiculo_id = @vehiculo.id
            venta.total = @vehiculo.tipo_vehiculo.total_pagar
            venta.save

            @soat = Soat.new(soat_params)
            @soat.vehiculo_id = @vehiculo.id
            @soat.venta_id = venta.id

            fechas_soat = @vehiculo.get_dates_soat

            @soat.fecha_ini = fechas_soat[0]
            @soat.fecha_fin = fechas_soat[1]

            if @soat.save

              ResumenCompra.resumen_compra(@cliente.email, @soat, @cliente, @vehiculo).deliver_later

              format.html { redirect_to @soat, notice: 'Soat was successfully created.' }
              format.json { render :show, status: :created, location: @soat }
            else
              format.html { render :new }
              format.json { render json: @soat.errors, status: :unprocessable_entity }
            end

          else
            @soat = Soat.new(soat_params)
            format.html { render :new }
          end
        else
          @soat = Soat.new(soat_params)
          format.html { render :new }
        end
      else
        @soat = Soat.new(soat_params)
        @soat.errors.add(:venta_id, :invaid, :message => "La fecha de la tarjeta de credito debe ser mayor a la compra")
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /soats/1
  # PATCH/PUT /soats/1.json
  def update
    respond_to do |format|
      if @soat.update(soat_params)
        format.html { redirect_to @soat, notice: 'Soat was successfully updated.' }
        format.json { render :show, status: :ok, location: @soat }
      else
        format.html { render :edit }
        format.json { render json: @soat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soats/1
  # DELETE /soats/1.json
  def destroy
    @soat.destroy
    respond_to do |format|
      format.html { redirect_to soats_url, notice: 'Soat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soat
      @soat = Soat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:soat).require(:cliente).permit(:tipo_documento,:numero_documento, :nombres, :apellidos, :email, :telefono)
    end

    def vehiculo_params
      params.require(:soat).require(:vehiculo).permit(:placa, :edad, :tipo_vehiculo_id, :clase_vehiculo_id)
    end

    def soat_params
      params.require(:soat).permit(:venta_id,:vehiculo_id, :fecha_ini, :fecha_fin)
    end
end
