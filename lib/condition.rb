# frozen_string_literal: true

require_relative 'error/ValeraError'

class Condition
  attr_accessor :field, :operator, :value

  def initialize(field:, operator:, value:) # TODO: проверять оператор
    case operator
    when '<', '>', '>=', '<=', '==', '!='
      self.field = field
      self.operator = operator
      self.value = value
    else
      raise ValeraError.new('Condition'), 'Invalid operator'
    end
  end

  def valid?(valera)
    if valera.respond_to?(field)
      actual_value = valera.send field
      actual_value.send operator, value
    else
      # TODO
      p 'Invalid field'
      false
    end
  end
end
