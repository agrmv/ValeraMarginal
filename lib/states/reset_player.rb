require_relative './base'
require_relative './check_valera'

module GameStates
  class ResetPlayer < Base
    def render
    end

    def next
      context[:valera] = Valera.new
      SaveStates.new context
    end
  end
end