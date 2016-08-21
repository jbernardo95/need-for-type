require 'curses'

module NeedForType
  class Window < Curses::Window

    # Curses
    CURSOR_VISIBLE = 1
    CURSOR_INVISIBLE = 0

    # Colors
    WHITE = 1
    GREEN = 2
    YELLOW = 3
    RED = 4

    # Modes
    NORMAL = Curses::A_NORMAL
    STANDOUT = Curses::A_STANDOUT

    def initialize(lines, cols, top, left, keypad=true)
      super(lines, cols, top, left)

      self.box('|', '-')
      self.keypad = keypad
      self.refresh
    end

    def init_colors
      Curses.start_color
      Curses.init_pair(WHITE, Curses::COLOR_WHITE, Curses::COLOR_BLACK)
      Curses.init_pair(GREEN, Curses::COLOR_GREEN, Curses::COLOR_BLACK)
      Curses.init_pair(YELLOW, Curses::COLOR_YELLOW, Curses::COLOR_BLACK)
      Curses.init_pair(RED, Curses::COLOR_RED, Curses::COLOR_BLACK)
    end

    def render_letters_with_color(color, mode)
      self.attron(Curses.color_pair(color) | mode)
      yield
      self.attroff(Curses.color_pair(color) | mode)
    end

    def render_display
      self.attrset(Curses.color_pair(WHITE) | Curses::A_NORMAL)

      self.clear
      self.box('|', '-')
      self.setpos(1,2)

      yield if block_given?

      self.refresh
    end
  end
end
