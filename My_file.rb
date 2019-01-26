#    mount_uploader :file, ImageUploader
     belongs_to :imageable, polymorphic: true
/home/olegdev/projects/my_store/public/images.jpeg


#Преобразование html в haml
%h1= @item.name
%ul
  %li Цена:          #{@item.price} гр.
  %li Вес:           #{@item.weight} кг.
  %li Описание:      #{@item.description}
                     = image_tag @item.avatar.url(:medium)
                     %br
                     %br
%p= link_to "Редактировать", edit_item_path(@item), :class => 'btn btn-warning'

#инфо по haml, сайт haml.info 
