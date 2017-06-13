# frozen_string_literal: true

module MountainView
  class ExtraPagesController < ::ApplicationController
    layout "mountain_view"

    def show
      render template: "mountain_view/extra_pages/#{params[:page]}"
    end
  end
end
