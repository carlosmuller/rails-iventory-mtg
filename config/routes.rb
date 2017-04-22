Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'firstseed', to: 'application#first_seed'
  get 'card/search/:query', to: 'cards#search'
  get 'set/add/:set', to: 'application#addSet'
  get 'set/:code', to: 'sets#byCode'
end
