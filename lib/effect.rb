require_relative 'error/ValeraError'

class Effect
  attr_accessor :field, :operator, :value

  def initialize(field, operator, value)
    if (operator == '+') || (operator == '-')
      self.field = field
      self.operator = operator
      self.value = value
    else
      raise ValeraError.new('Effect'), 'Invalid operator'
    end
  end

  def apply(valera)
    actual_value = valera.send field
    result = actual_value.send operator, value
    valera.send "#{field}=", result
  end
end