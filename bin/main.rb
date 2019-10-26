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
#p config.config['actions'][0]['go_to_work']['effects']



#print %(
# Enter action
#    1. Go to work
# Enter: )
v_action = gets.chomp
case v_action
when '1'
  config.action_name = 'go_to_work'
  cond =   Condition.new(config.action_conditions['check_mana']['field'], config.action_conditions['check_mana']['operator'], config.action_conditions['check_mana']['value'])
  effect = SimpleEffect.new(config.effects_action['field'], config.effects_action['operator'], config.effects_action['value'])
  action = Action.new(name: config.action_name, effects: [effect], conditions: [cond])
  action.run valera
  puts valera.health
else
  "Valera-Marginal"
end