class QuscoresController < ApplicationController
  before_action :set_quscore, only: [:show, :edit, :update, :destroy]

  # GET /quscores
  # GET /quscores.json
  def index
    @quscores = Quscore.all
  end

  # GET /quscores/1
  # GET /quscores/1.json
  def show
  end

  # GET /quscores/new
  def new
    @quscore = Quscore.new
  end

  # GET /quscores/1/edit
  def edit
  end

  # POST /quscores
  # POST /quscores.json
  def create
    @quscore = Quscore.new(quscore_params)

    respond_to do |format|
      if @quscore.save
        format.html { redirect_to @quscore, notice: 'Quscore was successfully created.' }
        format.json { render :show, status: :created, location: @quscore }
      else
        format.html { render :new }
        format.json { render json: @quscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quscores/1
  # PATCH/PUT /quscores/1.json
  def update
    respond_to do |format|
      if @quscore.update(quscore_params)
        format.html { redirect_to @quscore, notice: 'Quscore was successfully updated.' }
        format.json { render :show, status: :ok, location: @quscore }
      else
        format.html { render :edit }
        format.json { render json: @quscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quscores/1
  # DELETE /quscores/1.json
  def destroy
    @quscore.destroy
    respond_to do |format|
      format.html { redirect_to quscores_url, notice: 'Quscore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quscore
      @quscore = Quscore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quscore_params
      params[:quscore]
    end
end
