require 'curses'
require 'need_for_type/window'

module NeedForType
  class DisplayWindow < Window

    def initialize
      self.init_colors
      Curses.curs_set(CURSOR_INVISIBLE)
      super((Curses.lines / 3) * 2, Curses.cols, 0, 0, false)
    end

    def render_menu(selected_option)
      self.render_display do
        self.setpos(1,2)
        self.render_letters_with_color(GREEN, NORMAL) { self.addstr("Need For Type") }

        self.setpos(3,2)
        self.standout_selector(0, selected_option, "1. Easy")

        self.setpos(4,2)
        self.standout_selector(1, selected_option, "2. Medium")

        self.setpos(5,2)
        self.standout_selector(2, selected_option, "3. Hard")
      end
    end

    def render_game_text(text)
      self.render_display { self.addstr(text) }
    end

    def render_ingame_text(words, words_completed, failed=false)
      self.render_display do
        words.each_with_index do |word, index|
          if index < words_completed
            self.render_letters_with_color(GREEN, NORMAL) { self.addstr(word) }
          elsif index == words_completed
            color = failed ? RED : YELLOW
            self.render_letters_with_color(color, NORMAL) { self.addstr(word) }
          else
            self.render_letters_with_color(WHITE, NORMAL) { self.addstr(word) }
          end
        end
      end
    end

    def standout_selector(option, input, option_name)
      mode = input == option ? STANDOUT : NORMAL
      self.render_letters_with_color(WHITE, mode) { self.addstr(option_name) }
    end
  end
end
