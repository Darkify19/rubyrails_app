class ReservationsController < ApplicationController
  before_action :logged_in?, only: [:new, :create, :index, :show, :destroy]
  before_action :set_reservation, only: [:show, :destroy]

  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new
    @tables = Table.all
    @time_slots = TimeSlot.all
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
  
    # Fetch associated time_slot and table for validations
    time_slot = TimeSlot.find_by(id: @reservation.time_slot_id)
    table = Table.find_by(id: @reservation.table_id)
  
    # Clear previous messages
    flash.clear
  
    if time_slot.nil? || table.nil?
      flash.now[:danger] = "Invalid time slot or table selected."
      @tables = Table.all
      @time_slots = TimeSlot.all
      render 'new' and return
    end
  
    # Validate maximum reservations for the time slot
    if time_slot.reservations.where(reservation_date: @reservation.reservation_date).count >= time_slot.max_reservations
      flash.now[:warning] = "Time slot #{time_slot.slot_time} is fully booked for the selected date."
      @tables = Table.all
      @time_slots = TimeSlot.all
      render 'new' and return
    end
  
    # Validate table capacity
    if @reservation.number_of_people > table.max_capacity
      flash.now[:warning] = "Table #{table.table_number} cannot accommodate more than #{table.max_capacity} people."
      @tables = Table.all
      @time_slots = TimeSlot.all
      render 'new' and return
    end
  
    # Save reservation if all conditions are met
    if @reservation.save
      flash[:success] = "Reservation successfully created!"
      redirect_to @reservation and return
    else
      flash.now[:danger] = "Failed to create reservation. Please try again."
      @tables = Table.all
      @time_slots = TimeSlot.all
      render 'new'
    end
  end
  

  def show
  end

  def destroy
    @reservation.destroy
    flash[:success] = "Reservation canceled."
    redirect_to reservations_url
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :time_slot_id, :table_id, :number_of_people)
  end
end
