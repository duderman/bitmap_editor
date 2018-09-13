# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor::Commands::C, type: :command do
  subject { command }

  let(:command) { described_class.new({}) }
  let(:bitmap) { BitmapEditor::Bitmap.new(1, 2) }

  describe '::run' do
    subject { command.run(bitmap) }

    it { is_expected.to be_a(BitmapEditor::Bitmap) }
    its(:width) { is_expected.to eq(1) }
    its(:height) { is_expected.to eq(2) }
    its(:to_s) { is_expected.to eq("O\nO") }
  end
end
