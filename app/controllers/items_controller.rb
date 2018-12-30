class ItemsController < ApplicationController

  def index
    @items = Item.all                            #поиск в БД всех обектов
  end

#      /items       POST
   def create                                     #новый обект, который мы создаём и сохраняем в БД
  @item = Item.create(item_params)
   if @item.errors.empty?                         #проверяет есть ли ошибки
    redirect_to item_path(@item)                  # redirect_to делает ещё один запрос на сервер по пути item_path(items/:id)
  # render "show"
   else
     render "new"
   end
 end

#метод для сохранения параметров в БД
  private def item_params
     params.require(:item).permit(:price, :name, :weight, :description)
   end

#URL   /items/1      GET      HTTP метод
   def show                                           #то что выводит на экран после сохранения в БД
     @item = Item.find(params[:id])
     render "items/show"
   end

#     /items/1       PUT (всё равно что POST)
   def update                                         #обновляем форму
     @item = Item.find(params[:id])                   #поиск товара
     @item.update_attributes(item_params)             #обновляем атрибуты
       if @item.errors.empty?
         redirect_to item_path(@item)
       else
          render "edit"
      end
   end

#     /items/new      GET
   def new
     @Item = Item.new
   end

#    /items/1/edit    GET
   def edit                                             #редоктируем атрибты нашего товара
     @item = Item.find(params[:id])
   end

   #     /items/1        DELETE
      def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to action: "index"
      end
 end
