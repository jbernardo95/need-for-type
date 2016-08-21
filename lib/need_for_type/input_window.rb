require 'curses'
require 'need_for_type/window'

module NeedForType
  class InputWindow < Window

    def initialize
      super(Curses.lines / 3, Curses.cols, Curses.lines / 1.5, 0, true)
      @content = ''
    end

    def get_input
      self.getch
    end

    def add_input_content(content)
      self.render_display { self.addstr(content) }
    end

    def beep
      Curses.beep
    end
  end
end
