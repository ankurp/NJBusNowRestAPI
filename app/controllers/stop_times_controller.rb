class StopTimesController < ApplicationController
  before_action :set_stop_time, only: [:show, :edit, :update, :destroy]

  # GET /stop_times
  # GET /stop_times.json
  def index
    @stop_times = StopTime.all
  end

  # GET /stop_times/1
  # GET /stop_times/1.json
  def show
  end

  # GET /stop_times/new
  def new
    @stop_time = StopTime.new
  end

  # GET /stop_times/1/edit
  def edit
  end

  # POST /stop_times
  # POST /stop_times.json
  def create
    @stop_time = StopTime.new(stop_time_params)

    respond_to do |format|
      if @stop_time.save
        format.html { redirect_to @stop_time, notice: 'Stop time was successfully created.' }
        format.json { render :show, status: :created, location: @stop_time }
      else
        format.html { render :new }
        format.json { render json: @stop_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stop_times/1
  # PATCH/PUT /stop_times/1.json
  def update
    respond_to do |format|
      if @stop_time.update(stop_time_params)
        format.html { redirect_to @stop_time, notice: 'Stop time was successfully updated.' }
        format.json { render :show, status: :ok, location: @stop_time }
      else
        format.html { render :edit }
        format.json { render json: @stop_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stop_times/1
  # DELETE /stop_times/1.json
  def destroy
    @stop_time.destroy
    respond_to do |format|
      format.html { redirect_to stop_times_url, notice: 'Stop time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stop_time
      @stop_time = StopTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stop_time_params
      params.require(:stop_time).permit(:trip_id, :arrival_time, :departure_time, :stop_id, :stop_sequence, :pickup_type, :drop_off_type, :shape_dist_traveled)
    end
end
