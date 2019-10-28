require_relative './base'
require_relative './reset_player'
require_relative './exit_game'

module GameStates
  class PlayerDeath < Base
    def render
      puts '1) Reset player'
      puts '2) Exit'
    end

    def next
      case gets.to_i
      when 1
        ResetPlayer.new context
      when 2
        ExitGame.new
      else
        puts 'Invalid menu item!'
        self
      end
    end
  end
end