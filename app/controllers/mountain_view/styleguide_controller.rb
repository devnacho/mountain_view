module MountainView
  class StyleguideController < ::ApplicationController
    layout "mountain_view"

    def show
      @component = params[:id]
    end
  end
end
