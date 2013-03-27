require 'rails/generators'
require "rails/generators/active_record"

module ZenSeo
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      extend ActiveRecord::Generators::Migration

      source_root File.expand_path('../../../db/migrate', __FILE__)

      # Copies the migration template to db/migrate.
      def copy_files(*args)
        migration_template 'create_seos.rb', 'db/migrate/create_seos.rb'
      end

    end
  end
end
