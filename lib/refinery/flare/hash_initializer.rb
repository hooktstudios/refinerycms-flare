module Refinery
  module Flare
    module HashInitializer
      extend ActiveSupport::Concern
      include ActiveModel::Validations

      def initialize(props={})
        props.each_pair { |prop, value| send("#{prop}=", value) }
      end

      module ClassMethods
        def attr_hashable_model(attribute, model)
          attr_accessor attribute
          define_method "#{attribute}=" do |props|
            instance_variable_set("@#{attribute}", model.new(props))
          end
        end

        def attr_hashable_models(attribute, model)
          attr_accessor attribute
          define_method "#{attribute}=" do |props|
            # Initialize attribute
            if instance_variable_get("@#{attribute}").nil?
              instance_variable_set("@#{attribute}", [])
            end
            props.each do |part|
              instance_variable_get("@#{attribute}") << model.new(part)
            end
          end
        end
      end

    end
  end
end