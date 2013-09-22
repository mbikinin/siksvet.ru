class NewsController < ApplicationController
   def show
     @news = News.find_by_title(params[:id])
   end
end
