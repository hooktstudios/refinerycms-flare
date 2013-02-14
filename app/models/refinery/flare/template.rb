module Refinery
  module Flare

    # @todo validate refinery_options from Refinery::Page model fields
    class Template
      include HashInitializer
      include ActiveModel::Validations

      attr_accessor :repeatable,
        :refinery_options # deletable, view_template, layout_template
      attr_hashable_models :parts, Part

    end
  end
end