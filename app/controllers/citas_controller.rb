class CitasController < ApplicationController
  before_action :set_cita, only: %i[ show edit update destroy ]

  # GET /citas or /citas.json
  def index
    if current_user.admin? || current_user.medico?
      @citas = Cita.includes(:cliente).order(fecha: :desc).page(params[:page]).per(150)
    else
      @citas = current_user.cliente.citas.order(fecha: :desc).page(params[:page]).per(150) # Solo citas del usuario actual
    end
  end

  # GET /citas/1 or /citas/1.json
  def show
  end

  # GET /citas/new
  def new
    @cita = Cita.new
  end

  # GET /citas/1/edit
  def edit
  end

  # POST /citas or /citas.json
  def create
    if current_user.admin?
      @cita = Cita.new(cita_params)  # Admin puede crear citas libremente
    else
      cliente = current_user.cliente  # Encuentra el cliente asociado al usuario
      @cita = cliente.citas.build(cita_params)  # Asigna la cita al cliente del usuario
    end

    respond_to do |format|
      if @cita.save
        format.html { redirect_to @cita, notice: "Cita was successfully created." }
        format.json { render :show, status: :created, location: @cita }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citas/1 or /citas/1.json
  def update
    respond_to do |format|
      if @cita.update(cita_params)
        format.html { redirect_to @cita, notice: "Cita was successfully updated." }
        format.json { render :show, status: :ok, location: @cita }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citas/1 or /citas/1.json
  def destroy
    @cita.destroy!

    respond_to do |format|
      format.html { redirect_to citas_path, status: :see_other, notice: "Cita was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def export_xlsx
    if current_user.admin? || current_user.medico?
      @citas = Cita.all
    else
      @citas = current_user.cliente.citas
    end
    
    respond_to do |format|
      format.xlsx{
        response.headers['Content-Disposition'] = "attachment; filename=citas.xlsx"
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cita
      @cita = Cita.find(params.expect(:id))
      unless current_user.admin? || current_user.medico? || @cita.cliente.user_id == current_user.id
        redirect_to citas_path, alert: "No tienes permiso para ver esta cita."
      end    
    end

    # Only allow a list of trusted parameters through.
    def cita_params
      params.expect(cita: [ :cliente_id, :fecha, :hora_inicio, :numero_solicitado, :numero_realizados, :estado ])
    end
end
