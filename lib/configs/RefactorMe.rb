class RefactorMe
  attr_accessor :config, :field, :operator, :value

  def initialize(config)
    @config = config
  end

  def action_name
    config['actions'][0]['name']
  end

  def action_conditions
    config['actions'][0]['conditions']
  end

  def effects
    config['actions'][0]['effects']
  end

  def effects_action
    config['actions'][0]['effects']['effect']
  end

  def effects_condition
    config['actions'][0]['effects'][0]['conditions']
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