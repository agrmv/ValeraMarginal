require_relative '../lib/valera'
require_relative '../lib/states/states'
require_relative '../lib/states/load_actions'
require 'yaml'

class Game
  attr_accessor :player, :action_list

  def run
    #todo: to states

    states = States.new('lib/states/saved_states.yml')
    load_states = states.load
    valera = Valera.new(health: load_states.health, mana: load_states.mana, fun:
        load_states.fun, fatigue: load_states.fatigue, money: load_states.money)

    states.save(valera)
    @state = GameStates::LoadActions.new(valera: valera)
    while true
      @state.render
      @state = @state.next
    end
=begin
    action.run valera
    puts valera.health
    puts valera.mana
=end
  end

end

class ActionList
  attr_accessor :actions


end