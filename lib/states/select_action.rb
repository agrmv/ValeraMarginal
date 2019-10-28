module GameStates
  class SelectAction < Base
    def render
      puts 'Select action:'
      context[:actions].each_with_index { |action, id| puts "#{id}) #{action.name}" }
    end

    def next
      #todo: валидация id
      action_id = gets.to_i
      context[:actions][action_id].run context[:valera]
      CheckValera.new context
    end
  end
end
