MountainView::Engine.routes.draw do
  resources :styleguide, only: [:show]
end