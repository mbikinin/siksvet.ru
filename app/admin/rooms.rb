# encoding: utf-8

ActiveAdmin.register Room do
  menu  :label => "Все квартиры"
  
  index do
      column :id
      
      column 'Объект', :objects
      column 'Этаж', :number_floor
      column 'Кол. комнат', :count_rooms
      column 'Цена квартиры', :price
       column "Статус продажи" do |m|
        if m.is_active == true
          image_tag "/assets/ok.png"
        else 
          image_tag "/assets/no.png"
        end
      end
      column 'Общая площадь', :area_all
      column 'Жилая площадь', :area_living_room
      
      default_actions
  end
  form :html => { :multiple => true  } do |f|
    f.inputs 'Квартиры' do
      f.input :is_active,:as => :radio, :label => 'Продана или нет ?'

      f.input :objects, :label => 'Объект'      
      f.input :plan, :label => 'Планировка'
      f.input :number_floor, :as => :select, :collection => [1,2,3,4,5], :label => 'Этаж'
      f.input :number_room, :label => 'Номер квартиры'
      f.input :title, :label => 'Титл'
      f.input :price, :label => 'Цена'
      f.input :description, :label => 'Описание'
      f.input :count_rooms, :label => 'Количество комнат'
      f.input :area_all, :label => 'Общая площадь'
      f.input :area_living_room, :label => 'Жилая площадь'
      f.input :area_kitchen, :label => 'Площадь кухни'
      f.input :area_room_1, :label => 'Площадь комнаты 1'
      f.input :area_room_2, :label => 'Площадь комнаты 2'
      f.input :area_room_3, :label => 'Площадь комнаты 3'
      f.input :area_room_4, :label => 'Площадь комнаты 4'
      f.input :area_wc_room, :label => 'Площадь санузла'
      f.input :area_bathroom_room, :label => 'Площадь ванной комнаты(если имеется)'
      f.input :area_loggia, :label => 'Площадь лоджии'
      f.input :img, :as => :file, :multiple => true, :label => 'Изображеие планировки'
      f.buttons
    end
  end

 controller do load_and_authorize_resource :except => :index
    def scoped_collection
      params[:object].nil? ? end_of_association_chain.accessible_by(current_ability) : Room.where(:objects_id=>params[:object])
    end
    def new
      @plans = Plan.where(:objects_id=>params[:object])
    end
    def update
      update! do |format|
        flash[:notice] = "ОК! Успешно изменили"
        format.html { redirect_to admin_rooms_path }
      end
    end
    def create
      create! do |format|
        flash[:notice] = "ОК! Успешно изменили"
        format.html { redirect_to admin_rooms_path }
      end
    end
  end


end
