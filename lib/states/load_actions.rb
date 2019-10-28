require_relative './base'
require_relative './check_alive'
require_relative '../configs/config'
require_relative '../configs/action_config'

module GameStates
  class LoadActions < Base
    def render
      puts 'Load actions...'
    end

    def next
      config = ActionConfig.new(Config.new('lib/actions/actions.yml').load)
      actions = config.get_actions
      CheckAlive.new(context.merge(actions: actions))
      #self
    end
  end
end