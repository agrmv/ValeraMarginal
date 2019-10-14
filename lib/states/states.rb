# frozen_string_literal: true

require 'yaml'

class States
  def initialize(file)
    @file = file
  end

  def load
    YAML.safe_load(File.open(@file, 'r'))
  end

  def save(valera)
    File.open(@file, 'w') do |file|
      file.puts("health:  #{valera.health}")
      file.puts("mana:    #{valera.mana}")
      file.puts("fun:     #{valera.fun}")
      file.puts("fatigue: #{valera.fatigue}")
      file.puts("money:   #{valera.money}")
    end
  end
end
