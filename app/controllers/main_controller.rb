# coding: utf-8

class MainController < ApplicationController
  def index
    @title = "Главная"
    @partners = Partner.all
    @news = News.limit(3)
    @room = Room.all
  end
end
