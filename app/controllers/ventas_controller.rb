class VentasController < ApplicationController
  before_action :set_Venta, only: [:show, :edit, :update, :destroy]

  # GET /ventas
  # GET /ventas.json
  def index
    @venta = Venta.all
  end

  # GET /ventas/1
  # GET /ventas/1.json
  def show
  end

  # GET /ventas/new
  def new
    @Venta = Venta.new
  end

  # GET /ventas/1/edit
  def edit
  end

  # POST /ventas
  # POST /ventas.json
  def create
    @Venta = Venta.new(Venta_params)

    respond_to do |format|
      if @Venta.save
        format.html { redirect_to @Venta, notice: 'Venta was successfully created.' }
        format.json { render :show, status: :created, location: @Venta }
      else
        format.html { render :new }
        format.json { render json: @Venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ventas/1
  # PATCH/PUT /ventas/1.json
  def update
    respond_to do |format|
      if @Venta.update(Venta_params)
        format.html { redirect_to @Venta, notice: 'Venta was successfully updated.' }
        format.json { render :show, status: :ok, location: @Venta }
      else
        format.html { render :edit }
        format.json { render json: @Venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ventas/1
  # DELETE /ventas/1.json
  def destroy
    @Venta.destroy
    respond_to do |format|
      format.html { redirect_to venta_url, notice: 'Venta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Venta
      @Venta = Venta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Venta_params
      params.require(:Venta).permit(:cliente_id, :usuario_id)
    end
end
