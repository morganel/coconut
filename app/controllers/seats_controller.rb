class SeatsController < ApplicationController
  protect_from_forgery :except => :flight_seats
  before_action :set_seat, only: [:show, :edit, :update, :destroy]
    
  def flight_seats
    @flight = Flight.find(params[:flight_id])
    respond_to do |format|
	format.js
    end
    #render :partial => "flights/index_seat", :locals=>{:seats=>@flight.seats}
  end

  
  # GET /seats
  # GET /seats.json
  def index
    @seats = Seat.all
  end

  # GET /seats/1
  # GET /seats/1.json
  def show
  end

  # GET /seats/new
  def new
    @seat = Seat.new
  end

  # GET /seats/1/edit
  def edit
  end

  # POST /seats
  # POST /seats.json
  def create
    @seat = Seat.new(seat_params)
    puts("SEAT CREATED")
    @seat.save
    respond_to do |format|
      format.js
    end
        #@seat.save
        #puts(@seat.flight.seats)   
        #render :partial=>'flights/index_seat', :locals=>{:seats=>@seat.flight.seats}
        #$('#render_partial_form').html("<%= escape_javascript (render :partial=>'flights/index_seat', :locals=>{:seats=>@seat.flight.seats}) %>");
        #format.html { redirect_to @seat, notice: 'Seat was successfully created.' }
        #format.json { render :show, status: :created, location: @seat }
        #puts("HERE");
    
        #format.html { render :new }
        #format.json { render json: @seat.errors, status: :unprocessable_entity }
   
   # end
  end

  # PATCH/PUT /seats/1
  # PATCH/PUT /seats/1.json
  def update
    respond_to do |format|
      if @seat.update(seat_params)
        format.html { redirect_to @seat, notice: 'Seat was successfully updated.' }
        format.json { render :show, status: :ok, location: @seat }
      else
        format.html { render :edit }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seats/1
  # DELETE /seats/1.json
  def destroy
    @seat.destroy
    respond_to do |format|
      format.html { redirect_to seats_url, notice: 'Seat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seat
      @seat = Seat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seat_params
      params.require(:seat).permit(:flight_id, :name, :baggage)
    end
end
