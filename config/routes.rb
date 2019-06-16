Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats do 
    # nest a resource
    # /cats/1/toys
    # /cats/2/toys
    # list all toys for cats/1/toys
    # also never nest things 2 levels deep
    resources :toys, only: [:index]
    # update instead of nesting the :create here
  end
  # toys/:id
  # nest :create here 
  # top-level
  # single toy top-level
  resources :toys, only: [:create, :show, :update, :destroy] # do
  # resources :memories, only: :index
  # /toys/:id/memories
  # end
  # related information
  # associations
end
