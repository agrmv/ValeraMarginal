require_relative "./base"
require_relative "./select_action"
require_relative "../configs/config_adapter"

module GameStates
  class SaveStates < Base
    def render
      puts "States were saved"
    end

    def next
      ConfigAdapter.instance.save "configs/saved_states.yml", context[:valera]
      CheckValera.new context
    end
  end
end
