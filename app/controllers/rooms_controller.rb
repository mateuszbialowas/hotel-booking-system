class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path, notice: "Room was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @room.destroy
      flash[:notice] = "Room was successfully deleted."
    else
      binding.pry
      flash[:notice] = "Room could not be deleted. Delete the room's reservations first and try again."
    end


      respond_to do |format|
      format.html { redirect_to rooms_url }
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:room_type, :room_number)
    end
end
