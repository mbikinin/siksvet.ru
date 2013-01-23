# -*- encoding : utf-8 -*-
ActiveAdmin.register News do
  menu :label => "Новости"
  filter :title
  form :html => { :multiple => true  } do |f|
    f.inputs 'News' do
      f.input :title, :label => "Название"
      f.input :uri, :label => "uri"
      f.input :anounce, :input_html => { :class=> "mceEditor" }, :label => "Анонс" 
      f.input :text, :input_html => { :class=> "mceEditor" }, :label => "Текст"
      f.input :date, :label => "Дата"
      f.input :is_active, :label => "На сайте"
      f.buttons
    end
  end
  index do
    column :id
    column "Название", :title
    column "Дата", :date
    default_actions
  end
  controller do
    def update
      update! do |format|
        flash[:notice] = "ОК! Успешно изменили"
        format.html { redirect_to :back }
      end
    end
  end
end
