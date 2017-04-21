Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'firstseed' => 'application#first_seed', as: 'first_seed'
  get 'add/set/:set' => 'application#add_set'
  get 'card/search/:query' => 'cards#search'
end
