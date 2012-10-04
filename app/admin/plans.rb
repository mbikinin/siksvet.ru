# encoding: utf-8

ActiveAdmin.register Plan do
  menu  :label => "Все планировки"
  index do
      column :id
      column :floor do |f|
        "Этаж № #{ f.floor}"
      end
      column :objects
      default_actions
  end
  form :html => { :multiple => true  } do |f|
    f.inputs 'Объекты' do
      f.input :objects, :label => 'Объект'
      f.input :title, :label => 'Титл'
      f.input :description, :label => 'Описание'
      f.input :floor, :label => 'Укажите этаж'
      f.input :img, :as => :file, :multiple => true, :label => 'Изображеие планировки'

      f.buttons
    end
  end
 controller do load_and_authorize_resource :except => :index
    def scoped_collection
      params[:object].nil? ? end_of_association_chain.accessible_by(current_ability) : Plan.where(:objects_id=>params[:object])
    end
  end


end
