# frozen_string_literal: true

require_relative '../lib/condition'
require_relative '../lib/valera'
require_relative '../lib/states/states'
require_relative '../lib/effects/simple_effect'
require_relative '../lib/effects/conditional_effect'
require_relative '../lib/actions/action'
require 'yaml'

states = States.new('lib/states/saved_states.yml')
load_states = states.load
valera = Valera.new(health: load_states.health, mana: load_states.mana, fun:
    load_states.fun, fatigue: load_states.fatigue, money: load_states.money)

states.save(valera)

cond = Condition.new(field: 'health', operator: '>', value: 50)
cond2 = Condition.new(field: 'mana', operator: '>', value: 29)
effect = SimpleEffect.new('health', '+', 20)
effect2 = SimpleEffect.new('mana', '+', 10)

action = Action.new(name: 'name', effects: [effect, effect2], conditions: [cond, cond2])
action.run valera
puts valera.health
puts valera.mana