# encoding: utf-8
require "zen_seo/base"
require "zen_seo/seo"
require "zen_seo/controller_helper"
require "generators/install"

module ZenSeo
  def self.extended(model_class)
    return if model_class.respond_to? :has_seo_config
    model_class.instance_eval do
      extend Base
      @has_seo_config = {}
    end
  end

  def self.included(model_class)
    model_class.extend self
  end

end

ActiveRecord::Base.send :extend, ZenSeo::Base
ActionController::Base.send :include, ZenSeo::ControllerHelper


