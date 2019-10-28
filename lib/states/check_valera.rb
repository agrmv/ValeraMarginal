require_relative './base'
require_relative './select_action'

module GameStates
  class CheckValera < Base
    def render
      if valera_is_dead?
        puts 'Valera is dead :('
      else
        valera = context[:valera]
        puts "Valera params: Health [#{valera.health}] Mana [#{valera.mana}] Fun [#{valera.fun}] Fatigue [#{valera.fatigue}] Money [#{valera.money}]"
      end
    end

    def next
      if !valera_is_dead?
        SelectAction.new(context)
      else
        self
      end
    end

    def valera_is_dead?
      !context[:valera] || context[:valera].dead?
    end
  end
end
