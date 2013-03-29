module ZenSeo
  module ControllerHelper
    def self.included(base)
      base.send :include, InstanceMethods
    end

    module InstanceMethods
      def meta_tags_for(model)
        set_meta_tags :title=>model.seo.title,
                      :description=>model.seo.description,
                      :keywords=>model.seo.keywords
      end
      alias :meta_for :meta_tags_for
      protected :meta_tags_for
    end
  end
end
