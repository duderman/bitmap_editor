require './lib/bitmap_editor/errors'

class BitmapEditor
  module CommandToClassSupport
    def for_command(command)
      if self.const_defined?(command)
        self.const_get(command)
      else
        raise BitmapEditor::UnknownCommandError.new(command)
      end
    end

    def self.included(target)
      target.extend(self)
    end
  end
end
