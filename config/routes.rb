Rails.application.routes.draw do
   #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'items/create'           #путь к экшену create в контроллере items
root :to => 'items#index'    #путь к главной странице

    resources :items  do          #Это что бы заставить наш контроллер вести себя как RESTfull контроллер
    get :upvote, on: :member      #member это для того что бы методу upvote был доступ к каждому ресурсу items
  end 
end
