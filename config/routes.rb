MountainView::Engine.routes.draw do
  root to: "styleguide#index"

  resources :styleguide, only: [:index, :show]
end
