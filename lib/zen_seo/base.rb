module ZenSeo
  module Base
    def has_seo(options = {})
      has_seo_config options
      include Model
    end

    def has_seo_config(options={})
      @has_seo_config ||= options
    end

  end

  # Instance methods that will be added to all classes using FriendlyId.
  module Model
    extend ActiveSupport::Concern
    included do
      class_eval do
        attr_accessible :seo_attributes
        has_one :seo, :as=>:promotable
        accepts_nested_attributes_for :seo
        validates_presence_of :seo
        after_initialize :ensure_has_seo
        before_validation :generate_seo_fields
      end
    end

    # Convenience method for accessing the class method of the same name.
    def has_seo_config
      self.class.has_seo_config
    end

    private
    def ensure_has_seo
      seo || self.build_seo
    end

    def generate_seo_fields
      seo.title ||= self.send (has_seo_config[:title] || :title)
      seo.description ||= self.send (has_seo_config[:description] || :description)
      seo.keywords ||= self.send (has_seo_config[:keywords] || :keywords)
    end

  end
end

