require 'spec_helper'

RSpec.describe BitmapEditor::Line do
  subject { line }

  let(:line) { described_class.new('a 1 2 C DB') }

  its(:command) { is_expected.to eq('A') }
  its(:params) { is_expected.to eq(%w[1 2 C DB]) }
end
