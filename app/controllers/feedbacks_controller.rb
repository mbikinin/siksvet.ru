# -*- encoding : utf-8 -*-

class FeedbacksController < ApplicationController
  
  def order
    @feedback = Feedback.new
  end
  def create 
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      
       flash[:notice] = "Ваша заявка принята, в ближайшее время наши сотрудники свяжутся с Вами"
     else
       render 'order'
     end
  end
end
