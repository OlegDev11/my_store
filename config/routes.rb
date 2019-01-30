Rails.application.routes.draw do
  devise_for :uses
   #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'items/create'           #путь к экшену create в контроллере items
root :to => 'items#index'    #путь к главной странице

    resources :items  do             #Это что бы заставить наш контроллер вести себя как RESTfull контроллер
    get :upvote,    on: :member      # :member это для того что бы методу upvote был доступ (к каждому ресурсу items !)
    get :expensive, on: :collection  # :collection нужен для поиска по такому адресу http://localhost:3000/items/expensive
    resources :comments              #отслеживание URL адресов
  end                                # :collection применяется (для всей коллекции !)
get "admin/users_count" => "admin#users_count"
end
