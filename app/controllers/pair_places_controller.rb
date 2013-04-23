class PairPlacesController < ApplicationController

  before_filter :authenticate_user!

  # GET /pair_places
  # GET /pair_places.json
  def index
    @pair_places = current_user.try(:pair_places)
  end

  # GET /pair_places/1
  # GET /pair_places/1.json
  def show
  end

  # GET /pair_places/new
  def new
    @pair_place = PairPlace.new
  end

  # GET /pair_places/1/edit
  def edit
  end

  # POST /pair_places
  # POST /pair_places.json
  def create
    @pair_place = current_user.pair_places.new(pair_place_params)

    respond_to do |format|
      if @pair_place.save
        format.html { redirect_to @pair_place, notice: 'Pair place was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pair_place }
      else
        format.html { render action: 'new' }
        format.json { render json: @pair_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pair_places/1
  # PATCH/PUT /pair_places/1.json
  def update
    respond_to do |format|
      if @pair_place.update(pair_place_params)
        format.html { redirect_to @pair_place, notice: 'Pair place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pair_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pair_places/1
  # DELETE /pair_places/1.json
  def destroy
    @pair_place.destroy
    respond_to do |format|
      format.html { redirect_to pair_places_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pair_place
      @pair_place = PairPlace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pair_place_params
      params.require(:pair_place).permit(:nickname, :street, :city, :country)
    end
end
