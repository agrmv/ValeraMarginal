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
actions = config.get_actions
puts valera.health, valera.fatigue, valera.fun, valera.mana, valera.money
v_action = 0
case v_action
when 0
  actions[0].run valera
when 1
  actions[1].run valera
else
  "Valera-Marginal"
end
puts 'after'
puts valera.health, valera.fatigue, valera.fun, valera.mana, valera.money