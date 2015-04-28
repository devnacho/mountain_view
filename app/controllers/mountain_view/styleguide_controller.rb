module MountainView
  class StyleguideController < ::ApplicationController
    layout "mountain_view"

    def show
      @component = MountainView::Component.new(params[:id])
    end
  end
end