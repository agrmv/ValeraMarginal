class Condition
  attr_accessor :field, :operator, :value

  def initialize(field:, operator:, value:)#todo: проверять оператор
    self.field = field
    self.operator = operator
    self.value = value
  end

  def valid?(valera)
    actual_value = valera.send(field)
    actual_value.send(operator, value)
  end
end
