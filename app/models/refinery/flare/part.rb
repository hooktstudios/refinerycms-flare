module Refinery
  module Flare
    class Part
      include HashInitializer
      include ActiveModel::Validations

      attr_accessor :repeatable,
        :options # title, position
      attr_hashable_models :fields, Field

    end
  end
end