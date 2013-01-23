# coding: utf-8

class MainController < ApplicationController
  def index
    @title = "Главная"
    @partners = Partner.all
    @news = News.limit(3)
    @room = Room.all
    @room_active = Room.active
  end
end
