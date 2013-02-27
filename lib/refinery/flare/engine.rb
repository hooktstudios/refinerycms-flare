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
          plugin.pathname = root
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Flare)
        # @todo Find out why controller decorators aren't loaded at first
        Dir[root.join('app', 'decorators', '**', '*_decorator.rb')].flatten.uniq.each do |decorator|
          Rails.application.config.cache_classes ? require(decorator) : load(decorator)
        end
      end
    end
  end
end
