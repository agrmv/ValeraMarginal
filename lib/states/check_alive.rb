require_relative './base'
require_relative './select_action'

module GameStates
  class CheckAlive < Base
    def render
      puts 'Valera is dead :(' if valera_is_dead?
    end

    def next
      if !valera_is_dead?
        SelectAction.new(context)
      else
        self
      end
    end

    def valera_is_dead?
      if !context[:valera]
        true
      else
        context[:valera].dead?
      end
    end
  end
end
