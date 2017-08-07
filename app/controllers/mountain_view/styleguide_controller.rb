module MountainView
  class StyleguideController < ::ApplicationController
    layout "mountain_view"

    helper "mountain_view/styleguide"

    def show
      @component = MountainView::Component.new(params[:id])
    end
  end
end
