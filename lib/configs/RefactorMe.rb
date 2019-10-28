require_relative '../condition'
require_relative '../effects/simple_effect'
require_relative '../effects/conditional_effect'

class RefactorMe
  attr_accessor :config, :field, :operator, :value, :action_name

  def initialize(config)
    self.config = config
  end

  def action_name=(action_name)
    @action_name = action_name
    @config = config['actions'][@action_name]
  end

  def action_conditions
    @config['conditions']
        .map { |cond| cond.map { |k, v| [k.to_sym, v] }.to_h }
        .map { |cond| Condition.new(cond) }
  end

  def action_effects#todo: тупо сделать преобразование в этот класс
    @config['effects'].map do |effect|
      eff = self.effect effect.fetch('effect')
      conds = effect_conditions effect.fetch('conditions', [])
      ConditionalEffect.new(effect: eff, conditions: conds)
    end
  end

  def effect(effect)
    e = effect.map { |k, v| [k.to_sym, v] }.to_h
    SimpleEffect.new e
  end

  def effect_conditions(conditions)
    conditions
        .map { |cond| cond.map { |k, v| [k.to_sym, v] }.to_h }
        .map { |cond| Condition.new(cond) }
  end

end


#TODO merge config.rb with this???