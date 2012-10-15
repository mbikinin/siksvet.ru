class TinymceAssetsController < ApplicationController
    def new 
      @image = TinymceImage.new
    end
    def create
      @image = TinymceImage.new(:file=>params[:file])
      # Take upload from params[:file] and store it somehow...
      # Optionally also accept params[:hint] and consume if needed
      @image.save
      render json: {
        image: {
          url: @image.file.url, style: "padding 20px"
        }
      }, content_type: "text/html"
  end
end
