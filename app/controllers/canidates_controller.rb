class CanidatesController < ApplicationController
  before_action :set_canidate, only: [:show, :edit, :update, :destroy]

  # GET /canidates
  # GET /canidates.json
  def index
    @canidates = Canidate.all
  end

  # GET /canidates/1
  # GET /canidates/1.json
  def show
  end

  # GET /canidates/new
  def new
    @canidate = Canidate.new
  end

  # GET /canidates/1/edit
  def edit
  end

  # POST /canidates
  # POST /canidates.json
  def create
    @canidate = Canidate.new(canidate_params)

    respond_to do |format|
      if @canidate.save
        format.html { redirect_to @canidate, notice: 'Canidate was successfully created.' }
        format.json { render :show, status: :created, location: @canidate }
      else
        format.html { render :new }
        format.json { render json: @canidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /canidates/1
  # PATCH/PUT /canidates/1.json
  def update
    respond_to do |format|
      if @canidate.update(canidate_params)
        format.html { redirect_to @canidate, notice: 'Canidate was successfully updated.' }
        format.json { render :show, status: :ok, location: @canidate }
      else
        format.html { render :edit }
        format.json { render json: @canidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canidates/1
  # DELETE /canidates/1.json
  def destroy
    @canidate.destroy
    respond_to do |format|
      format.html { redirect_to canidates_url, notice: 'Canidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canidate
      @canidate = Canidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canidate_params
      params.require(:canidate).permit(:name, :party)
    end
end
