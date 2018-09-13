# frozen_string_literal: true

require_relative './errors'

class BitmapEditor
  module CommandToClassSupport
    COMMAND_FORMAT = /\A[A-Z]\Z/

    def for_command(command)
      return const_get(command) if valid_command?(command)

      raise BitmapEditor::UnknownCommandError, command
    end

    def self.included(target)
      target.extend(self)
    end

    def valid_command?(command)
      command =~ COMMAND_FORMAT && const_defined?(command)
    end
  end
end
