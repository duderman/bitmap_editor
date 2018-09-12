# frozen_string_literal: true

require './lib/bitmap_editor/errors'

class BitmapEditor
  module CommandToClassSupport
    COMMAND_FORMAT = /\A[A-Z]\Z/

    def for_command(command)
      if command =~ COMMAND_FORMAT && const_defined?(command)
        const_get(command)
      else
        raise BitmapEditor::UnknownCommandError, command
      end
    end

    def self.included(target)
      target.extend(self)
    end
  end
end
