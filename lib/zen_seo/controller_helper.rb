module ZenSeo
  module ControllerHelper
    def self.included(base)
      base.send :include, InstanceMethods
    end

    module InstanceMethods
      def meta_tags_for(model)
        set_meta_tags model.to_meta
      end
      alias :meta_for :meta_tags_for
      protected :meta_tags_for
    end
  end
end
