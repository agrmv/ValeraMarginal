module GameStates
  class SelectAction < Base
    def render
      puts 'Select action:'
      context[:actions].each_with_index { |action, id| puts "#{id}) #{action.name}" }
    end

    def next
      #todo: get from console ....
      gets
      self
    end
  end
end
