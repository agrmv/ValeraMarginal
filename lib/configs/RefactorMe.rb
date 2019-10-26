class RefactorMe
  attr_accessor :config, :field, :operator, :value, :action_name

  def initialize(config)
    self.config = config
  end

  def action_name=(action_name)
    @action_name = action_name
  end

  def action_conditions
    config['actions'][0][@action_name]['conditions']
  end

  def effects
    config['actions'][0][@action_name]['effects']
  end

  def effects_action
    config['actions'][0][@action_name]['effects']['effect']
  end

  def effects_condition
    config['actions'][0][@action_name]['effects']['condition']
  end

end


#TODO merge config.rb with this???


#actions:
#    - name: Go to work
#conditions:
#    - mana < 50
#- fatigue < 10
#effects:
#    - effect: fun - 5
#conditions:
#    - fun > 10
#- mana - 30
#- money + 100
#- fatigue + 70