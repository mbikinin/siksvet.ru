# encoding: utf-8

ActiveAdmin.register Page do
  menu :label=> "Меню сайта"
  
  form :html => { :multiple => true  } do |f|
    f.inputs 'Альбомы' do
      f.input :title, :label => "Титл"
      f.input :uri, :label => "Адрес сраницы на Ангийском"
      f.input :description, :label => "Краткое описание"
      f.input :text, :label => "Текст"
      f.input :on_menu, :as => :radio, :label => "Участвует в меню"
    end
    f.buttons
  end
  index do
      column :id
      column "Название акции", :title
      column "Адрес страницы", :uri
      column "Участвует в меню" do |m|
        if m.on_menu == true
          image_tag "/assets/ok.png"
        else 
          image_tag "/assets/no.png"
        end
      end
      default_actions
  end
    


end
