class AnscoresController < ApplicationController
  before_action :set_anscore, only: [:show, :edit, :update, :destroy]

  # GET /anscores
  # GET /anscores.json
  def index
    @anscores = Anscore.all
  end

  # GET /anscores/1
  # GET /anscores/1.json
  def show
  end

  # GET /anscores/new
  def new
    @anscore = Anscore.new
  end

  # GET /anscores/1/edit
  def edit
  end

  # POST /anscores
  # POST /anscores.json
  def create
    @anscore = Anscore.new(anscore_params)

    respond_to do |format|
      if @anscore.save
        format.html { redirect_to @anscore, notice: 'Anscore was successfully created.' }
        format.json { render :show, status: :created, location: @anscore }
      else
        format.html { render :new }
        format.json { render json: @anscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anscores/1
  # PATCH/PUT /anscores/1.json
  def update
    respond_to do |format|
      if @anscore.update(anscore_params)
        format.html { redirect_to @anscore, notice: 'Anscore was successfully updated.' }
        format.json { render :show, status: :ok, location: @anscore }
      else
        format.html { render :edit }
        format.json { render json: @anscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anscores/1
  # DELETE /anscores/1.json
  def destroy
    @anscore.destroy
    respond_to do |format|
      format.html { redirect_to anscores_url, notice: 'Anscore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anscore
      @anscore = Anscore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anscore_params
      params[:anscore]
    end
end
