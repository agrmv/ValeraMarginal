# frozen_string_literal: true

require_relative '../lib/condition'
require_relative '../lib/valera'
require_relative '../lib/states/states'
require_relative '../lib/effect'
require_relative '../lib/action'
require 'yaml'

states = States.new('lib/states/saved_states.yml')
load_states = states.load
valera = Valera.new(health: load_states.health, mana: load_states.mana, fun:
    load_states.fun, fatigue: load_states.fatigue, money: load_states.money)

states.save(valera)
# cond = Condition.new(field: 'health', operator: '+', value: 200)
# puts cond.valid?(valera)
# valera.health=(200)
# puts valera.health

cond = Condition.new(field: 'health', operator: '>', value: 50)
cond2 = Condition.new(field: 'mana', operator: '>', value: 50)
effect = Effect.new('health', '-', 60)
aeffect = ActionEffect.new(effect: effect, conditions: [cond2])
action = Action.new(effects: [aeffect], conditions: [cond])
action.run valera
puts valera.health
