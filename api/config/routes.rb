Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/postgres' do
    get '/nearest', to: 'postgres#nearest'
  end

  scope '/mongo' do
    get '/nearest', to: 'mongo#nearest'
  end
end
