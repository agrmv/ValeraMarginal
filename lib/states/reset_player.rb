require_relative './base'
require_relative './check_valera'

module GameStates
  class ResetPlayer < Base
    def render
    end

    def next
      context[:valera] = Valera.new
      #todo: to save valera
      CheckValera.new context
    end
  end
end