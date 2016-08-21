module NeedForType
  class FileManager
    attr_accessor :content

    def initialize(difficulty)
      @path = "#{NeedForType::GEM_ROOT}/assets/#{difficulty_to_s(difficulty)}/"
    end

    # Reads random file from difficulty folder
    def get_random_text
      directory = Dir[@path]
      random_file = rand(1..directory.count)

      # TODO: apply markov's chain's to the text
      @content = File.read("#{@path}/#{random_file}.txt")
    end

    private

    def difficulty_to_s(difficulty)
      case difficulty
      when 0
        'easy'
      when 1
        'medium'
      when 2
        'hard'
      end
    end
  end
end
