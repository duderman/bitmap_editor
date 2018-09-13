# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor::Line do
  subject { line }

  let(:line) { described_class.new(raw) }
  let(:raw) { 'a 1 2 C DB' }

  its(:command) { is_expected.to eq('A') }
  its(:params) { is_expected.to eq(%w[1 2 C DB]) }

  context 'when raw line is empty' do
    let(:raw) { '' }

    its(:command) { is_expected.to eq('') }
    its(:params) { is_expected.to eq([]) }
  end

  context 'when raw line is nil' do
    let(:raw) { nil }

    its(:command) { is_expected.to eq('') }
    its(:params) { is_expected.to eq([]) }
  end
end
