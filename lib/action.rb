class Action
  attr_accessor :name, :conditions, :effects

  def initialize(effects: [], conditions: [])
    self.effects = effects
    self.conditions = conditions
  end

  def valid?(valera)
    conditions.all? { |c| c.valid?(valera) }
  end

  def run(valera)
    effects.each { |e| e.apply valera } if valid? valera
  end
end

class ActionEffect
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