class ReservationsController < ApplicationController
  before_action :logged_in?, only: [:new, :create, :index, :show, :destroy]
  before_action :set_reservation, only: [:show, :update, :destroy]

  def index
    # Only show the logged-in user's reservations
    @reservations = current_user.reservations.includes(:user, :time_slot, :table)
  end
  
  def new
    @reservation = Reservation.new
    @time_slots = TimeSlot.all # You may want to order this by time if needed
    @tables = Table.all
    @today = Date.today # Store today's date to pass to the form
    load_tables_and_time_slots
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
      load_tables_and_time_slots
      render 'new' and return
    end
  
    # Validate maximum reservations for the time slot
    if time_slot.reservations.where(reservation_date: @reservation.reservation_date).count >= time_slot.max_reservations
      formatted_time = time_slot.slot_time.strftime('%I:%M %p') # Format the time in AM/PM
      flash.now[:warning] = "Time slot #{formatted_time} is fully booked for the selected date."
      load_tables_and_time_slots
      render 'new' and return
    end
  
    # Validate table capacity
    if @reservation.number_of_people > table.max_capacity
      flash.now[:warning] = "Table #{table.table_number} cannot accommodate more than #{table.max_capacity} people."
      load_tables_and_time_slots
      render 'new' and return
    end
  
    # Save reservation if all conditions are met
    if @reservation.save
      flash[:success] = "Reservation successfully created!"
      redirect_to @reservation and return
    else
      # Debug: Show errors
      flash.now[:danger] = "Failed to create reservation. Please try again. Errors: #{@reservation.errors.full_messages.join(', ')}"
      load_tables_and_time_slots
      render 'new'
    end
  end
  
  
  def show
  end

  def update
    # Only allow admins to update the reservation status
    if current_user.role == 'admin'
      if @reservation.update(reservation_params)
        flash[:success] = "Reservation status updated."
        redirect_to reservations_path
      else
        flash[:danger] = "Failed to update status."
        render :show
      end
    else
      flash[:danger] = "You are not authorized to update this reservation's status."
      redirect_to reservations_path
    end
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
  
  def load_tables_and_time_slots
    @tables = Table.all
    @time_slots = TimeSlot.all
  end
end
