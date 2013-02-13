module Refinery
  module Flare
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Flare

      engine_name :refinery_flare

      initializer "register refinerycms_flare plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "flare"
          plugin.hide_from_menu = true
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Flare)
      end
    end
  end
end
