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

valera = Valera.new(health: load_states.health, mana: load_states.mana, fun: load_states.fun, fatigue: load_states.fatigue, money: load_states.money)

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
  cond  =   Condition.new(config.action_conditions['mana']['field'], config.action_conditions['mana']['operator'], config.action_conditions['mana']['value'])
  cond2 =   Condition.new(config.action_conditions['fatigue']['field'], config.action_conditions['fatigue']['operator'], config.action_conditions['fatigue']['value'])
  cond3 =   Condition.new(config.effect_condition('fun')['field'], config.effect_condition('fun')['operator'], config.effect_condition('fun')['value'])
  effect = SimpleEffect.new(config.effects['fun']['field'], config.effects['fun']['operator'], config.effects['fun']['value'])

  p config.effects['mana'], config.effects['money'], config.effects['fatigue']

  effect2 = SimpleEffect.new(config.effects['mana']['field'], config.effects['mana']['operator'], config.effects['mana']['value'])
  effect3 = SimpleEffect.new(config.effects['money']['field'], config.effects['money']['operator'], config.effects['money']['value'])
  effect4 = SimpleEffect.new(config.effects['fatigue']['field'], config.effects['fatigue']['operator'], config.effects['fatigue']['value'])

  action = Action.new(name: 'Zachem?', effects: [effect, effect2, effect3, effect4], conditions: [cond, cond3])
  action.run valera
  puts valera.money
else
  "Valera-Marginal"
end