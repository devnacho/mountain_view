module MountainView
  class Stub
    attr_reader :meta, :data

    def initialize(component_properties)
      @meta = component_properties[:mv_stub_meta] || {}
      @data = component_properties.except(:mv_stub_meta) || {}
    end

    def meta_title
      if @meta.title.present?
        @meta.title
      else
        () + " " + (index + 1).to_s
      end
    end

  end
end
