# frozen_string_literal: true

require 'yaml'

class States
  def initialize(file)
    @file = file
  end

  def load
    YAML.load_file(File.open(@file))
  end

  def save(valera)
    File.open(@file, 'w+') do |file|
      file.write valera.to_yaml
    end
  end
end
