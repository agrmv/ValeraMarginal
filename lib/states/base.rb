module GameStates
  class Base
    attr_reader :context

    def initialize(context = {})
      @context = context
    end
  end
end

#todo: load actions (?, 0) -> check is dead (1) -> render + input actions (2) -> run action (3) -> save valera (4) -> 1