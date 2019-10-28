require_relative './base'

module GameStates
  class ExitGame < Base
    def render
      puts 'Ещё увидимся...'
    end

    def next
      exit(true)
    end
  end
end