class CitasController < ApplicationController
  before_action :set_cita, only: %i[ show edit update destroy ]

  # GET /citas or /citas.json
  def index
    @citas = Cita.all
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
    @cita = Cita.new(cita_params)

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cita
      @cita = Cita.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cita_params
      params.expect(cita: [ :cliente_id, :fecha, :hora_inicio, :numero_solicitado, :numero_realizados, :estado ])
    end
end
