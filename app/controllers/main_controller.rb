# coding: utf-8

class MainController < ApplicationController
  def index
    @title = "Главная"
    @partners = Partner.all
  end
end
