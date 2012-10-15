# coding: utf-8
class DeclarationsController < ApplicationController

  def index
    @title = "Проектные декларации"
    @declarations = params[:id] ? Declaration.where(:is_active=>true, :objects_id=>params[:id]) : Declaration.where(:is_active=>true)
  end
  
  def show
    @title = "Проектные декларации"
    @declarations = Declaration.where(:id=>params[:id], :is_active=>true)
    @object = Objects.find_by_id(params[:id])
  end
end
