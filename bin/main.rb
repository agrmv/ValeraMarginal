# frozen_string_literal: true

require_relative '../lib/condition'
require_relative '../lib/valera'
require_relative '../lib/configs/config'
require_relative '../lib/effects/simple_effect'
require_relative '../lib/effects/conditional_effect'
require_relative '../lib/actions/action'
require_relative '../lib/configs/RefactorMe'
require 'yaml'

load_states = Config.new('lib/configs/saved_states.yml').load
valera = Valera.new(health: load_states.health, mana: load_states.mana, fun:
    load_states.fun, fatigue: load_states.fatigue, money: load_states.money)

config = RefactorMe.new(Config.new('lib/actions/actions.yml').load)
#p config.action_conditions
#configs.save(valera)

puts  config.effects['effect']['field']


cond = Condition.new(field: config.action_conditions[1]['field'], operator: config.action_conditions[1]['operator'], value: config.action_conditions[1]['value'])
#cond2 = Condition.new(field: 'mana', operator: '>', value: 29)
effect = SimpleEffect.new(config.effects_action['field'], config.effects_action['operator'], config.effects_action['value'])
p effect
#effect2 = SimpleEffect.new('mana', '+', 10)

action = Action.new(name: config.action_name, effects: [effect], conditions: [cond])
action.run valera
puts valera.health
#puts valera.mana