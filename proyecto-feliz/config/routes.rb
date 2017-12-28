Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :course

  # Esto crea la ruta para el indice lo hice manual por que aqui estara el buscador
  get '/courses', to: 'courses#index'
  post '/courses/search/', to: 'courses#search' # Esta ruta recibe /courses/search/
  # y llama al controlaador#metodo

  # las ruotas permiten redirigir a cualquier metodo que crees
end
