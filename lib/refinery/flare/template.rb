module Refinery
  module Flare

    class Template
      include HashInitializer
      include ActiveSupport::Configurable

      config_accessor :templates
      self.templates = {}

      attr_accessor :repeatable,
        :refinery_options
      attr_hashable_models :parts, Part

      validate :refinery_options_exist?

      def refinery_options_exist?
        unless refinery_options.keys - Refinery::Page.attribute_names.map { |a| a.to_sym } == []
          errors.add(:refinery_options, "Invalid refinery_options for #{self.class}")
        end
      end

      class << self

        def define_template(identifier, attributes)
          Template.config.templates[identifier] = Template.new(attributes)
        end
      end

    end
  end
end