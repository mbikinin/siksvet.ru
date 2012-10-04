# coding: utf-8

class PlansController < ApplicationController
  def show
    @object = Objects.find_by_id(params[:id])
    @plan = Plan.where(:objects_id=>params[:id], :floor=>params[:floor]).first
    @err = @plan ? false : "Нет планировок для выбранного этажа"
  end
end
