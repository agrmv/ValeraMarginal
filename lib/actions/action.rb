class Action
  attr_accessor :name, :conditions, :effects

  def initialize(name:, effects:, conditions: [])
    self.name = name
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