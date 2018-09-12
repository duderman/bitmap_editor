# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor::Commands::H, type: :command do
  subject { command }

  let(:command) { described_class.new(y: 1, x1: 2, x2: 3, color: 'C') }
  let(:bitmap) { BitmapEditor::Bitmap.new(3, 2) }

  describe '::run' do
    subject { command.run(bitmap) }

    it { is_expected.to be bitmap }
    its(:to_s) { is_expected.to eq("OCC\nOOO") }
  end
end
