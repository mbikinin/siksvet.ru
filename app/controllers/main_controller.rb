class MainController < ApplicationController
  def index
    @slides = Slide.all
  end
end
