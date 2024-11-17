class Admin::ReservationsController < ApplicationController
  before_action :require_admin

  def index
    @reservations = Reservation.all
  end

  def edit
    @reservation = Reservation.find(params[:id])  # Find the reservation by ID
  end

  def update
    @reservation = Reservation.find(params[:id])  # Find the reservation by ID
    if @reservation.update(reservation_params)     # Update reservation with the parameters
      flash[:success] = 'Reservation updated successfully!'
      redirect_to admin_reservations_path            # Redirect back to index after successful update
    else
      flash[:danger] = 'Failed to update reservation.'  # If the update fails, render the edit form again
      render :edit
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status, :message)  # Permit status and message to be updated
  end

  def require_admin
    unless current_user&.role == 'admin'
      flash[:danger] = 'You must be an admin to access this page.'
      redirect_to root_path
    end
  end
end
