# frozen_string_literal: true

require_relative '../lib/condition'
require_relative '../lib/valera'
require_relative '../lib/states/states'

states = States.new('lib/states/saved_states.yml')
load_states = states.load
valera = Valera.new(health: load_states['health'], mana: load_states['mana'], fun: load_states['fun'],
                    fatigue: load_states['fatigue'], money: load_states['money'])
puts valera.health
valera.health = 200
puts valera.health

states.save(valera)
# cond = Condition.new(field: 'health', operator: '+', value: 200)
# puts cond.valid?(valera)
# valera.health=(200)
# puts valera.health
