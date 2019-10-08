class Valera
  attr_reader :health, :mana, :fun, :fatigue
  attr_accessor :money

  def initialize(health: 100, mana: 0, fun: 0, money: 0, fatigue: 0)
    @health = health
    @mana = mana
    @fun = fun
    @fatigue = money
    @money = fatigue
  end

  def dead?
    health <= 0
  end

  def health=(health)
    @health = if health > 100
      100
    else
      health < 0 ? 0 : health
    end
  end

  def mana=(mana)
    @mana = if mana > 100
      100
    else
      mana < 0 ? 0 : mana
    end
  end

  def fun=(fun)
    @fun = if fun > 10
      10
    else
      fun < 0 ? -10 : fun
    end
  end

  def fatigue=(fatigue)
    @fatigue = if fatigue > 100
      100
    else
      fatigue < 0 ? 0 : fatigue
    end
  end
end
