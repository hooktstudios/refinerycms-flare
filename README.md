# Flare extension for Refinery CMS.

> Advanced page parts options for RefineryCMS pages.

## How to build this extension as a gem

    cd vendor/extensions/flare
    gem build refinerycms-flare.gemspec
    gem install refinerycms-flare.gem
    gem push refinerycms-flare.gem

## Testing

    rake refinery:testing:dummy_app
    guard