class PagesController < ApplicationController
  
  def show
    @content = Page.find_by_uri(params[:id])
    @title = @content.title
  end
end
