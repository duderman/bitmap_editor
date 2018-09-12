require 'spec_helper'

RSpec.describe BitmapEditor::Commands::L, type: :command do
  subject { command }

  let(:command) { described_class.new(x: 1, y: 1, color: 'C') }
  let(:bitmap) { BitmapEditor::Bitmap.new(2, 2) }

  describe '::run' do
    subject { command.run(bitmap) }

    it { is_expected.to be bitmap }
    it 'changes pixel color' do
      expect { subject }.to change { bitmap[0, 0] }.to('C')
    end
  end
end
