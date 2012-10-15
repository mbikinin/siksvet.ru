class RoomsController < ApplicationController
  def show
    @room = Room.find_by_id(params[:id])
    @object = Objects.find_by_id(@room.objects_id)
  end
end
