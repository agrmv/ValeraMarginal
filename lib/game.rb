require_relative '../lib/valera'
require_relative '../lib/states/load_actions'
require 'yaml'

class Game
  attr_accessor :player, :action_list

  def run
    load_states = Config.new('lib/configs/saved_states.yml').load
    valera = Valera.new(health: load_states.health, mana: load_states.mana, fun: load_states.fun, fatigue: load_states.fatigue, money: load_states.money)

    @state = GameStates::LoadActions.new(valera: valera)
    while true#todo: условие завершения
      @state.render
      @state = @state.next
    end
  end

end

class ActionList
  attr_accessor :actions


end