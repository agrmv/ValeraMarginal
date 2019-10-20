class Effect
  attr_accessor :field, :operator, :value

  def initialize(field, operator, value)
    self.field = field
    self.operator = operator
    self.value = value
  end

  def apply(valera)
    actual_value = valera.send field
    result = actual_value.send operator, value
    valera.send "#{field}=", result
  end
end