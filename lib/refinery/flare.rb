require 'refinerycms-core'

module Refinery
  autoload :FlareGenerator, 'generators/refinery/flare_generator'

  module Flare
    require 'refinery/flare/engine'
    require 'refinery/flare/hash_initializer'
    require 'refinery/flare/field'
    require 'refinery/flare/part'
    require 'refinery/flare/template'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
