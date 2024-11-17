class AdminController < ApplicationController
    before_action :admin_user
  
    def dashboard
      @reservations = Reservation.all
      @time_slots = TimeSlot.all
      @tables = Table.all
    end
  
    def manage_time_slots
      @time_slots = TimeSlot.all
    end
  
    def manage_reservations
      @reservations = Reservation.all
    end
  
    private
  
    def admin_user
      # Logic to verify if the current user is an admin (You can add admin flag to the User model)
      redirect_to(root_url) unless current_user&.admin?
    end
  end
  