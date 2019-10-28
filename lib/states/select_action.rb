module GameStates
  class SelectAction < Base
    def render
      puts 'Select action:'
      context[:actions].each_with_index { |action, id| puts "#{id + 1}) #{action.name}" }
    end

    def next
      action_id = gets.to_i - 1
      if (0...context[:actions].length).include?(action_id)
        context[:actions][action_id].run context[:valera]
        CheckValera.new context
      else
        puts 'Invalid action!'
        self
      end
    end
  end
end
