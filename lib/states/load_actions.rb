require_relative './base'
require_relative './check_alive'
require_relative '../basic/condition'
require_relative '../basic/effect'
require_relative '../actions/event'
require_relative '../actions/action'

module GameStates
  class LoadActions < Base
    def render
      puts 'Load actions...'
    end

    def next
      #todo: load from config
      cond = Condition.new(field: 'health', operator: '>', value: 1)
      cond2 = Condition.new(field: 'mana', operator: '>', value: 4)
      effect = Effect.new('health', '-', 10)
      event1 = Event.new(effect: effect)
      action = Action.new({name: 'test', events: [event1], conditions: [cond, cond2]})

      actions = [action]
      CheckAlive.new(context.merge(actions: actions))
      #self
    end
  end
end