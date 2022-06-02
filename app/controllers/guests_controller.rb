class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!


  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def edit
  end

  def create
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to guest_url(@guest), notice: "Guest was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to guest_url(@guest), notice: "Guest was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @guest.destroy
      flash[:notice] = "Guest was successfully deleted."
    else
      flash[:notice] = "Guest could not be deleted. Delete the guest's reservations first and try again."
    end

    respond_to do |format|
      format.html { redirect_to guests_url }
    end
  end

  private
    def set_guest
      @guest = Guest.find(params[:id])
    end

    def guest_params
      params.require(:guest).permit(:guest_name, :guest_passport_no, :guest_phone)
    end
end
