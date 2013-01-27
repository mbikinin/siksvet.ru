# encoding: utf-8

ActiveAdmin.register Declaration do
  filter :title

  menu  :label => "Декларации, документы"

  form :html => { :multiple => true  } do |f|
    f.inputs 'Декларации' do
      f.input :title, :label => 'Титл'
      f.input :objects, :label =>'Объект' 
      f.input :anounce, :label => 'Краткое описание'
      f.input :text, :label => 'Полный текст(если необходимо)'
      f.input :file, :as => :rich_picker, :config => { :type=>'file',:allowed_styles => [:original], :style => 'width: 400px !important;' }, :label => 'Файл декларации'
      f.input :is_active,:as => :radio, :label => 'Показывать на сайте'

      f.buttons
    end
  end

  index do |pl|
      column :id
      column "Название документа", :title
      column "Объект", :objects
      column "Активный" do |m|
        if m.is_active?
          image_tag "/assets/ok.png"
        else 
          image_tag "/assets/no.png"
        end
      end
      default_actions
  end
   controller do
     def update
      update! do |format|
        flash[:notice] = "ОК! Успешно изменили"
        format.html { redirect_to admin_declarations_path }
      end
    end
    def create
      create! do |format|
        flash[:notice] = "ОК! Успешно создали"
        format.html { redirect_to admin_declarations_path }
      end
    end
    
  end




end