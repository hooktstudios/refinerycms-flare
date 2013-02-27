module Refinery
  module Flare

    class Template
      include HashInitializer

      @@all = {}

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
        def all
          @@all
        end

        def define_template(identifier, attributes)
          Template.all[identifier] = Template.new(attributes)
        end
      end

    end
  end
end