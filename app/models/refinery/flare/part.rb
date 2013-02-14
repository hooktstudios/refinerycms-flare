module Refinery
  module Flare
    class Part
      include HashInitializer
      include ActiveModel::Validations

      attr_accessor :repeatable,
        :refinery_options # title, position
      attr_hashable_models :fields, Field

      validate :refinery_options_exist?

      def refinery_options_exist?
        unless refinery_options.keys - Refinery::PagePart.attribute_names.map { |a| a.to_sym } == []
          errors.add(:refinery_options, "Invalid refinery_options for #{self.class}")
        end
      end
    end
  end
end