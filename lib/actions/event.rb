class Event
  attr_accessor :conditions, :effect

  def initialize(effect:, conditions: [])
    self.effect = effect
    self.conditions = conditions
  end

  def ok?(valera)
    conditions.all? { |c| c.valid?(valera) }
  end

  def apply(valera)
    effect.apply valera if ok? valera
  end
end