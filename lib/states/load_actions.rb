require_relative "./base"
require_relative "./check_valera"
require_relative "../configs/config_adapter"
require_relative "../configs/action_config"

module GameStates
  class LoadActions < Base
    def render
      puts "Load actions..."
    end

    def next
      config = ActionConfig.new ConfigAdapter.instance.load "configs/actions.yml"
      actions = config.actions
      CheckValera.new(context.merge(actions: actions))
    end
  end
end
