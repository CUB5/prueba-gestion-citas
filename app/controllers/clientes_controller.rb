class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.order(created_at: :desc).page(params[:page]).per(150)
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: "Cliente was successfully created." }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: "Cliente was successfully updated." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente.destroy!

    respond_to do |format|
      format.html { redirect_to clientes_path, status: :see_other, notice: "Cliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def export_xlsx
    @clientes = Cliente.all
    
    respond_to do |format|
      format.xlsx{
        response.headers['Content-Disposition'] = "attachment; filename=clientes.xlsx"
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.expect(cliente: [ :codigo, :razon_social, :cif, :direccion, :municipio, :provincia, :fecha_inicio_contrato, :fecha_expiracion_contrato, :numero_reconocimientos ])
    end
end
