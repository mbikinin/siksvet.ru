class RoomsController < ApplicationController
  def index
    @rooms1 = Room.active.where(:count_rooms => 1).order("RAND()").limit(3)
    @rooms2 = Room.active.where(:count_rooms => 2).order("RAND()").limit(3)
    @rooms3 = Room.active.where(:count_rooms => 3).order("RAND()").limit(3)
  end
  def show
    @room = Room.find_by_number_room(params[:id])
    @object = Objects.find_by_id(@room.objects_id)
  end
end
