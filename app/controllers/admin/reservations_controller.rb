# app/controllers/admin/reservations_controller.rb
class Admin::ReservationsController < ApplicationController
    before_action :require_admin
  
    def index
      @reservations = Reservation.all
    end
  
    def show
      @reservation = Reservation.find(params[:id])
    end
  
    def update
      @reservation = Reservation.find(params[:id])
      if @reservation.update(status: params[:status])
        flash[:success] = 'Reservation status updated!'
        redirect_to admin_reservations_path
      else
        render :show
      end
    end
  
    private
  
    def require_admin
      unless current_user&.role == 'admin'
        flash[:danger] = 'You must be an admin to access this page.'
        redirect_to root_path
      end
    end
  end
  