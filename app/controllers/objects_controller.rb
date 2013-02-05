# coding: utf-8
class ObjectsController < ApplicationController

  def index
    @title = "Наши объекты"
    @objects = Objects.all  
  end
  
  def show
    @object = Objects.find_by_id(params[:id])
  end
  
  def map
    @object = Objects.find_by_id(params[:id])
  end
end
