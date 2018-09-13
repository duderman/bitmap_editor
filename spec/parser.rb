# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor::Parser do
  describe '.parse_integer' do
    subject { described_class.parse_integer(val) }

    context 'with integer argument' do
      let(:val) { 1 }

      it { is_expected.to eq(1) }
    end

    context 'with argument that does not match int regex' do
      let(:val) { 'a' }

      it { is_expected.to eq('a') }
    end

    context 'with a negative' do
      let(:val) { '-2' }

      it { is_expected.to eq(-2) }
    end

    context 'with a positive' do
      let(:val) { '3' }

      it { is_expected.to eq(3) }
    end
  end
end
