require_relative '../lib/condition'
require_relative '../lib/valera'

valera = Valera.new
cond = Condition.new(field: 'health', operator: '+', value: 50)
puts cond.actual?(valera)

