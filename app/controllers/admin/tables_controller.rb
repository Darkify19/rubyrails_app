class Admin::TablesController < ApplicationController
    before_action :require_admin
  
    def index
      @tables = Table.order(:table_number).page(params[:page]) # Add pagination here if needed
            @tables = Table.page(params[:page]).per(6)

    end
  
    def new
      @table = Table.new
    end
  
    def create
      @table = Table.new(table_params)
      if @table.save
        flash[:success] = 'Table created successfully!'
        redirect_to admin_tables_path
      else
        render :new
      end
    end
  
    def edit
      @table = Table.find(params[:id])
    end
  
    def update
      @table = Table.find(params[:id])
      if @table.update(table_params)
        flash[:success] = 'Table updated successfully!'
        redirect_to admin_tables_path
      else
        flash[:warning] = 'There is an existing table already.'
        render :edit
      end
    end
  
    def destroy
      @table = Table.find(params[:id])
      @table.destroy
      flash[:success] = 'Table deleted successfully!'
      redirect_to admin_tables_path
    end
    
  
    def toggle_availability
  @table = Table.find(params[:id])
  @table.update(availability: !@table.availability)
  flash[:success] = "Table availability updated!"
  redirect_to admin_tables_path
    end
    
    private
  
    def table_params
      params.require(:table).permit(:table_number, :max_capacity, :availability)
    end
  
    def require_admin
      unless current_user&.role == 'admin'
        flash[:danger] = 'You must be an admin to access this page.'
        redirect_to root_path
      end
    end
  end