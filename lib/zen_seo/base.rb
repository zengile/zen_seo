module ZenSeo
  module Base
    def has_seo(options = {})
      has_seo_config options
      include Model
    end

    def has_seo_config(options={})
      defaults={title: :title, description: :description, keywords: :keywords}
      @has_seo_config ||= defaults.merge options
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

    def to_meta
      options_hash=fill_in(excessive_options)
      options_hash.merge(seo_hash)
    end

    private
    def excessive_options
      has_seo_config[:options] || {}
    end

    def ensure_has_seo
      seo || self.build_seo
    end

    def generate_seo_fields
      seo.title=        self.send(has_seo_config[:title])        if seo.title.blank?
      seo.description=  self.send(has_seo_config[:description])  if seo.description.blank?
      seo.keywords=     self.send(has_seo_config[:keywords])     if seo.keywords.blank?
    end

    def seo_hash
      keys=[:title, :description, :keywords]
      base_hash={}
      keys.each do |key|
        base_hash[key] = seo.send(key) || self.send(has_seo_config[key])
      end
      base_hash
    end

    def fill_in(hash)
      hash.each do |k,v|
        if v.is_a? Symbol
          hash[k]=self.send(v)
        elsif v.is_a? Hash
          fill_in(v)
        end
      end
    end

  end
end

