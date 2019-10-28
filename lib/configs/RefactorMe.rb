require_relative '../condition'
require_relative '../effects/simple_effect'
require_relative '../effects/conditional_effect'
require_relative '../actions/action'

class Hash
  def to_symbol_hash
    self.map { |k, v| [k.to_sym, v] }.to_h
  end
end

class RefactorMe
  attr_accessor :config, :field, :operator, :value, :action_name

  def initialize(config)
    self.config = config
  end

  def action_name=(action_name)
    @action_name = action_name
    @config = config['actions'][@action_name]
  end

  def get_actions
    config['actions'].map do |name, config|
      action_name = config.fetch('name', name)
      effects = action_effects config['effects']
      conditions = get_conditions_from_config config.fetch('conditions', [])
      Action.new(name: action_name, effects: effects, conditions: conditions)
    end
  end

  def action_conditions
    @config['conditions'].map(&:to_symbol_hash)
                         .map { |cond| Condition.new(cond) }
  end

  def action_effects(config)
    #todo: тупо сделать преобразование в этот класс
    config.map do |effect|
      eff = self.effect effect.fetch('effect')
      conds = get_conditions_from_config effect.fetch('conditions', [])
      ConditionalEffect.new(effect: eff, conditions: conds)
    end
  end

  def effect(effect)
    e = effect.to_symbol_hash
    SimpleEffect.new e
  end

  def get_conditions_from_config(config)
    config.map(&:to_symbol_hash)
          .map { |cond| Condition.new(cond) }
  end

end

#TODO merge config.rb with this???