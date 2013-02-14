module Refinery
  module Flare
    class Field
      include HashInitializer
      include ActiveModel::Validations

      attr_accessor :title,
        :refinery_type, # string, text, resource, image
        :refinery_type_options

    end
  end
end