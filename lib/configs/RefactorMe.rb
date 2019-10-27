
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
  end

  def effects
    @config['effects']
  end

  def effect_condition(effect)
    effects[effect]['condition'][effect]
  end

end


#TODO merge config.rb with this???