class Action
  attr_accessor :conds, :effects

  def initialize(conds: [], effects: [])
    self.conds = conds
    self.effects = effects
  end

  def valid?(valera)
    conds.map { |c| c.valid?(valera) }
        .inject(true) { |acc, el| acc && el }
  end

  def run(valera)
    effects.collect { |e| e.apply valera } if self.valid? valera
  end
end
