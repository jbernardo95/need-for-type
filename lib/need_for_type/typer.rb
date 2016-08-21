require 'curses'

require 'need_for_type/display_window'
require 'need_for_type/input_window'

require 'need_for_type/states'

module NeedForType
  class Typer

    def initialize
      display_window = NeedForType::DisplayWindow.new
      input_window = NeedForType::InputWindow.new

      @state = NeedForType::States::Menu.new(display_window, input_window)
    end

    def play
      while true
        @state = @state.update
      end
    end

  end
end
