module GameStates
  class SelectAction < Base
    def render
      puts 'Select action:'
      context[:actions].each_with_index do |action, id|
        id = id + 1
        puts "#{id}) #{action.name}"
      end
    end

    def next
      if (action_id = gets.to_i).between?(1, 8)
        context[:actions][action_id].run context[:valera]
        CheckValera.new context
      else
        puts 'Invalid action!'
      end
    end
  end
end
