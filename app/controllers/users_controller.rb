class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
    before_action :correct_user, only: [:edit, :update]

    def index
      @users = User.all
      end
      
      def show
        @user = User.find(params[:id])
      
        # Admin view logic
        if current_user.admin?
          @current_month = Date.today.beginning_of_month
          @end_of_month = @current_month.end_of_month
      
          # Get reservations for the current month
          @reservations = Reservation.where(reservation_date: @current_month..@end_of_month)
          
          # Get all time slots
          @time_slots = TimeSlot.all
        end
      end
      

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
    flash[:success] = "Welcome to the Sample App!"
    redirect_to @user

    else
    render 'new'
    end
    
    end

    def edit
      @user = User.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:success] = "Profile updated"
          redirect_to @user
          else
         
        render 'edit'
        end
        end

    private
    def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
      end

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user == current_user
        end
    end
    
  end