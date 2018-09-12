# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor::Commands::V, type: :command do
  subject { command }

  let(:command) { described_class.new(x: 1, y1: 1, y2: 3, color: 'C') }
  let(:bitmap) { BitmapEditor::Bitmap.new(2, 4) }

  describe '::run' do
    subject { command.run(bitmap) }

    it { is_expected.to be bitmap }
    its(:to_s) { is_expected.to eq("CO\nCO\nCO\nOO") }
  end
end
