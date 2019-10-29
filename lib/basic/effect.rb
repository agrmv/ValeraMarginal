require_relative "../../lib/error/ValeraError"

class Effect
  attr_accessor :field, :operator, :value

  def initialize(field:, operator:, value:)
    case operator
    when "+", "-"
      self.field = field
      self.operator = operator
      self.value = value
    else
      raise ValeraError.new("Effect"), "Invalid operator: '#{operator}'! Available operators: '+', '-'"
    end
  end

  def apply(valera)
    raise ValeraError.new("Effect"), "Invalid field '#{field}'. Available fields: #{valera.instance_variables}" unless valera.respond_to?(field)

    actual_value = valera.send field
    result = actual_value.send operator, value
    valera.send "#{field}=", result
  end
end