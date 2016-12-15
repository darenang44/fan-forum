Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :topics
  root 'topics#index'
end

# Prefix Verb   URI Pattern                Controller#Action
#     topics GET    /topics(.:format)          topics#index
#            POST   /topics(.:format)          topics#create
#  new_topic GET    /topics/new(.:format)      topics#new
# edit_topic GET    /topics/:id/edit(.:format) topics#edit
#      topic GET    /topics/:id(.:format)      topics#show
#            PATCH  /topics/:id(.:format)      topics#update
#            PUT    /topics/:id(.:format)      topics#update
#            DELETE /topics/:id(.:format)      topics#destroy
#       root GET    /                          topic#index
