MountainView::Engine.routes.draw do
  root to: "styleguide#index"

  def extra_routes
    get "extra_pages/:page",
        to: "extra_pages#show",
        as: "extra_pages"
  end

  resources :styleguide, only: [:index, :show],
                         path: MountainView.configuration.styleguide_path
  extra_routes if MountainView.configuration.extra_pages.any?
end
