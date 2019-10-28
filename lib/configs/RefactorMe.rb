require_relative '../../lib/condition'
require_relative '../effects/simple_effect'

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

  def effects
    @config['effects']
        .map { |cond| cond.map { |k, v| [k.to_sym, v] }.to_h }
        .map do |cond|
      cond.delete(:conditions) #todo: hard code
      SimpleEffect.new(cond)
    end
  end

  def effect_condition
    effects
        .map { |event| event['conditions'] }
        .map { |cond| cond.map { |k, v| [k.to_sym, v] }.to_h }
        .map { |cond| Condition.new(cond) }
  end

end


#TODO merge config.rb with this???