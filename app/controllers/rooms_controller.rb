class RoomsController < ApplicationController
  def index
    @rooms1 = Room.active.where(:count_rooms => 1).order("RAND(id)").limit(3)
    @rooms2 = Room.active.where(:count_rooms => 2).order("RAND(id)").limit(3)
    @rooms3 = Room.active.where(:count_rooms => 3).order("RAND(id)").limit(3)
  end
  def show
    @room = Room.find_by_id(params[:id])
    @object = Objects.find_by_id(@room.objects_id)
  end
end
