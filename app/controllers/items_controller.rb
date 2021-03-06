class ItemsController < ApplicationController
  #код повтояется, выносим его в один метод @item = Item.create(item_params)
  before_action :find_item,          only: [:show, :edit, :update, :destroy, :upvote]     # only: и :except так же можно использовать
  #для запрета доступа пользователю к этим методам, но разрешить для админа
  #before_action :check_if_admin,     only: [:edit, :update, :new, :cewate, :destroy]

  def index
     @items = Item       #Обект Active Racord Ralation, он хранит в себе все обекты которые ниже
     @items = @items.where("price >= ?", params[:price_from])        if params[:price_from]
     @items = @items.where("created_at >= ?", 1.day.ago)             if params[:today]
     @items = @items.where("votes_count >= ?", params[:votes_count]) if params[:votes_count]
     @items = @items.order("votes_count DESC", "price").limit(20)         # сортировка от самого популярного товара до непоп.

  #  @items = Item.where("price >= ?", params[:price_from])               #поиск по цене больше или равно
  #  @items = Item.all                                                    #поиск в БД всех обектов all
  end

  def upvote                                          #возможность голосовать за тот или иной товар
    @item.increment!(:votes_count)
    redirect_to action: :index
  end

  def expensive                                      #для поиска товара, который больше 1000 по цене
    @items = Item.where("price > 1000")
    render "index"
  end

  #      /items       POST
  def create                                      #новый обект, который мы создаём и сохраняем в БД
    @item = Item.create(item_params)
    if @item.errors.empty?                            #проверяет есть ли ошибки
    redirect_to item_path(@item)                      #redirect_to делает ещё один запрос на сервер по пути item_path(items/:id)
    # render "show"
    else
      render "new"
    end
  end

#URL   /items/1      GET      HTTP метод
   def show                                           #то что выводит на экран после сохранения в БД
#     @item = Item.find(params[:id])
     unless @item
       render html: "Page not found", status: 404
     end
   end

#     /items/1       PUT (всё равно что POST)
   def update                                                       #обновляем форму
  #   @item = Item.find(params[:id])                                #поиск товара
     @item.update_attributes(item_params)                           #обновляем атрибуты
       if @item.errors.empty?
         flash[:success]= "Item successfully updated!"
         redirect_to item_path(@item)
       else
         flash.now[:error] = "You made mistakes in your form! please correct them"
         render "edit"
      end
   end

#     /items/new      GET
   def new
     @Item = Item.new
   end

#    /items/1/edit    GET
   def edit                                                                 #редоктируем атрибты нашего товара
  #   @item = Item.find(params[:id])
   end

   #     /items/1        DELETE
   def destroy
    #    @item = Item.find(params[:id])
     @item.destroy
     redirect_to  action: "index"
   end

  #метод для сохранения параметров в БД
private
      def item_params
         params.require(:item).permit(:price, :name, :weight, :description, :avatar)
      end

      def find_item                                                        #метод для повторяющегося кода
      #  @item = Item.find(params[:id])
        @item = Item.where(id: params[:id]).first
        render_404 unless @item
      end
 end
