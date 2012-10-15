# -*- encoding : utf-8 -*-

ActiveAdmin.register Partner do

  filter :title
  filter :id
  filter :text
  menu  :label => "Партнеры"
  
  form :html => { :multiple => true  } do |f|
    f.inputs 'Партнеры' do
      f.input :title, :label => "Партнер"
      f.input :description, :lable=> "Описание"       
      f.input :contacts, :label => 'Контакты'    
      f.input :img, :label=>"Логотип"
      f.input :on_main, :label => 'Показывать на главной ?'
      f.input :is_active, :label => 'Активный ?'
      f.buttons
    end    
  end
  index do
      column :id
      column "Партнер", :title
      column "Контакты", :contacts
      column "На главной" do |m|
        m.on_main? ? "Да" : "Нет"    
      end
      column "Активный" do |a|
        a.is_active? ? "Да" : "Нет"        
      end 
      default_actions
  end
end  
