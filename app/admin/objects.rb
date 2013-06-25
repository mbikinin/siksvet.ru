# encoding: utf-8

ActiveAdmin.register Objects do
  filter :title
  filter :address
  filter :id

  menu  :label => "Наши объекты"

  form :html => { :multiple => true  } do |f|
    f.inputs 'Объекты' do
      f.input :title, :label => 'Титл'
      f.input :description, :label => 'Описание'
      f.input :address, :label => 'Адрес'
      f.input :floors, :label => 'Этажность дома (описание)'
      f.input :floors_int, :label => 'Этажность дома (цифрми)'
      f.input :phone, :label => 'Телефон'
      f.input :longitude, :label => 'Долгота()'
      f.input :latitude, :label => 'Широта()'
      f.input :date_finish, :label => 'Срок сдачи дома'
      f.input :img, :as => :file, :multiple => true, :label => 'Изображеие(250x200)'
      f.input :img_floor, :as => :file, :multiple => true, :label => 'Изображеие которое будет использоваться для выбора этажа'
      f.input :is_active,:as => :radio, :label => 'Показывать на сайте'

      f.buttons
    end
  end

  index do |pl|
      column :id
      column "Название объекта", :title
      column "Адрес", :address
      default_actions
      column 'Планировка' do |obj|
        link_to 'Планировка объекта', object_plan_path(obj)
      end
      column 'Квартиры' do |obj|
        link_to 'Квартиры объекта', room_description_path(obj)
      end
      column "Фотографии" do |post|
        link_to 'Фотографии', admin_objects_photo_path(post)
      end
  end


  ###
  #   Controller
  ###
  controller do
    def scheme_floor
       @object = Objects.find_by_id(params[:id])
       @plans = Plan.where(:object_id => @object.id)
    end
    def photo
       @object = Objects.find_by_id(params[:id])
       @photos = Photo.where(:objects_id=>params[:id])
    end
     def update
      update! do |format|
        flash[:notice] = "ОК! Успешно изменили"
        format.html { redirect_to admin_objects_path }
      end
    end
    def create
      create! do |format|
        flash[:notice] = "ОК! Успешно создали"
        format.html { redirect_to admin_objects_path }
      end
    end
  end

end