# frozen_string_literal: true

class BitmapEditor
  class UnknownCommandError < StandardError
    attr_reader :command

    def initialize(command)
      @command = command
      super("Uknown command '#{command}'")
    end
  end

  class Nan < StandardError
    attr_reader :number

    def initialize(number)
      @number = number
      super("'#{@number}' is not a decimal number")
    end
  end

  class InvalidParams < StandardError
  end
end
