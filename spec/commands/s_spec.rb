# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor::Commands::S, type: :command do
  subject { command }

  let(:command) { described_class.new(out: out) }
  let(:bitmap) { BitmapEditor::Bitmap.new(2, 1) }
  let(:out) { StringIO.new }

  describe '::run' do
    subject { command.run(bitmap) }

    it { is_expected.to be bitmap }

    describe 'output' do
      subject { out.read }

      before do
        command.run(bitmap)
        out.rewind
      end

      it { is_expected.to eq("OO\n") }

      context 'when bitmap is empty' do
        let(:bitmap) { BitmapEditor::Bitmap.new }

        it { is_expected.to eq("There is no image\n") }
      end
    end
  end
end
