# app/controllers/admin/time_slots_controller.rb
class Admin::TimeSlotsController < ApplicationController
    before_action :require_admin
  
    def index
      @time_slots = TimeSlot.all
    end
  
    def new
      @time_slot = TimeSlot.new
    end
  
    def create
      @time_slot = TimeSlot.new(time_slot_params)
      if @time_slot.save
        flash[:success] = 'Time slot created successfully!'
        redirect_to admin_time_slots_path
      else
        render :new
      end
    end
  
    def edit
      @time_slot = TimeSlot.find(params[:id])
    end
  
    def update
      @time_slot = TimeSlot.find(params[:id])
      if @time_slot.update(time_slot_params)
        flash[:success] = 'Time slot updated successfully!'
        redirect_to admin_time_slots_path
      else
        render :edit
      end
    end
  
    def destroy
      @time_slot = TimeSlot.find(params[:id])
      @time_slot.destroy
      flash[:success] = 'Time slot deleted successfully!'
      redirect_to admin_time_slots_path
    end
  
    private
  
    def time_slot_params
      params.require(:time_slot).permit(:slot_time, :max_reservations)
    end
  
    def require_admin
      unless current_user&.role == 'admin'
        flash[:danger] = 'You must be an admin to access this page.'
        redirect_to root_path
      end
    end
  end
  