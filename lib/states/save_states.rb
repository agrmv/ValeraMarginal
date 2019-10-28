require_relative './base'
require_relative './select_action'
require_relative '../../lib/configs/config'

module GameStates
  class SaveStates < Base
    def render
      puts 'States were saved'
    end

    def next
      Config.new('lib/configs/saved_states-rip.yml').save(context[:valera])
      CheckValera.new context
    end
  end
end
