require 'curses'

require 'need_for_type/states'
require 'need_for_type/file_manager'

module NeedForType::States
  class Game < State

    def initialize(display_window, input_window, difficulty)
      super(display_window, input_window)

      @difficulty = difficulty
      @state = :init_game
      @text = ''
    end

    def update
      case @state
      when :init_game
        handle_init_game
      when :in_game
        handle_in_game
      end
    end

    private

    def handle_init_game
      file_manager = NeedForType::FileManager.new(@difficulty)

      @text = file_manager.get_random_text
      prepare_words
      @display_window.render_game_text(@text)

      @word = ""
      @input_words = []
      @words_completed = 0

      @state = :in_game

      return self
    end

    def handle_in_game
      input = @input_window.get_input
      temp = @word + input

      if compare(temp) && !ended?(temp)
        @word = temp
        @input_window.add_input_content(temp)
        @display_window.render_ingame_text(@file_words, @words_completed)
      elsif ended?(temp)
        @word = temp
        @words_completed+=1

        if @input_words.size == @file_words.size
          @state = :menu
        else
          @display_window.render_ingame_text(@file_words, @words_completed)
          reset_input
        end
      else
        @display_window.render_ingame_text(@file_words, @words_completed, true)
        @input_window.add_input_content(@word)
        @input_window.beep
      end

      return self
    end

    def reset_input
      @input_window.render_display
      @input_words << @word
      @word = ""
    end

    def ended?(word)
      @file_words[@words_completed] == word
    end

    def compare(word)
      @file_words[@words_completed].start_with?(word)
    end

    def prepare_words
      @file_words = @text.split(' ').map { |word| word << ' ' }
    end
  end
end
