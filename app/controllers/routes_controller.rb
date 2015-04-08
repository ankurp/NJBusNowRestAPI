class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :directions]

  # GET /routes
  # GET /routes.json
  def index
    @routes = Route.all
    respond_to do |format|
      format.html { render :index }
      format.xml { render xml: @routes, status: :ok }
      format.json { render json: @routes, status: :ok }
    end
  end

  def data
    render :data
  end

  # GET /routes/1
  # GET /routes/1.json
  def show
  end

  # GET /routes/new
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
  end

  def directions
    @trips = {}
    @route.trips.each do |t|
      @trips["#{t.trip_headsign} #{t.direction_id}"] = t
    end
    render :json => @trips.values
  end

  # POST /routes
  # POST /routes.json
  def create
    @route = Route.new(route_params)

    respond_to do |format|
      if @route.save
        format.html { redirect_to @route, notice: 'Route was successfully created.' }
        format.xml { render :show, status: :created, location: @route }
        format.json { render :show, status: :created, location: @route }
      else
        format.html { render :new }
        format.xml { render xml: @route.errors, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routes/1
  # PATCH/PUT /routes/1.json
  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to @route, notice: 'Route was successfully updated.' }
        format.xml { render :show, status: :created, location: @route }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit }
        format.xml { render xml: @route.errors, status: :unprocessable_entity }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to routes_url, notice: 'Route was successfully destroyed.' }
      format.xml { head :no_content }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:route_id, :agency_id, :route_short_name, :route_type)
    end
end
