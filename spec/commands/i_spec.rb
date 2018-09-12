require 'spec_helper'

RSpec.describe BitmapEditor::Commands::I, type: :command do
  subject { command }

  let(:command) { described_class.new(width: 1, height: 2) }

  describe '::run' do
    subject { command.run(BitmapEditor::Bitmap.new) }

    it { is_expected.to be_a(BitmapEditor::Bitmap) }
    its(:width) { is_expected.to eq(1) }
    its(:height) { is_expected.to eq(2) }
    its(:to_s) { is_expected.to eq("O\nO") }
  end
end
