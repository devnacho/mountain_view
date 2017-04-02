MountainView::Engine.routes.draw do
  root to: "styleguide#index"

  resources :styleguide, only: [:index, :show], path: MountainView.configuration.styleguide_path
end
