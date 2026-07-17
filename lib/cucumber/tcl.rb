require 'cucumber'
require 'cucumber/glue/dsl'
require_relative 'tcl/activate_steps'
require_relative 'tcl/framework'
require_relative 'tcl/step_definitions'

module Cucumber
  module Tcl
    extend ::Cucumber::Glue::Dsl

    # Wrap this in a rescue block so RSpec can load the file without crashing
    begin
      InstallPlugin do |config|
        Cucumber::Tcl.install(config)
      end
    rescue NoMethodError
      # We are running outside of a Cucumber test run (e.g., in RSpec).
      # Safely ignore the plugin registration.
    end
    def self.install(cucumber_config)
      # Unless configured off, we should start up a new
      # framework for each scenario, which results
      # in a new TCL interpreter.  This can be used
      # to check that there is no data leakage between
      # scenarios when testing poorly understood code
      if ENV['SHARE_FRAMEWORK'] == '1'
        framework = Framework.new(cucumber_config)
        create_step_definitions = -> { StepDefinitions.new(framework) }
      else
        create_step_definitions = -> { StepDefinitions.new(Framework.new(cucumber_config)) }
      end
      cucumber_config.filters << ActivateSteps.new(create_step_definitions)
    end
  end
end
