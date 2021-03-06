class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :stops]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    respond_to do |format|
      format.html { render :index }
      format.xml { render xml: @trips, status: :ok }
      format.json { render json: @trips, status: :ok }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  def stops
    render :json => @trip.stop_times.map(&:stop)
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.xml { render :show, status: :created, location: @trip }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.xml { render xml: @trip.errors, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.xml { render :show, status: :created, location: @trip }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.xml { render xml: @trip.errors, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.xml { head :no_content }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:route_id, :service_id, :trip_id, :trip_headsign, :direction_id, :block_id, :shape_id)
    end
end
