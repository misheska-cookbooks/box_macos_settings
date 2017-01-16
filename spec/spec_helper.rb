require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  # Use colour in STDOUT
  config.color = true

  # Guard against people using deprecated RSpec syntax
  config.raise_errors_for_deprecations!

  # Use the specified formatter
  config.formatter = :documentation

  # Why aren't these the defaults?
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  # Be random!
  config.order = 'random'
end

# at_exit { ChefSpec::Coverage.report! }
