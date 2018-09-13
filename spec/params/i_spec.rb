# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor::Params::I, type: :param do
  subject { param }

  let(:param) { described_class.new(raw_params) }
  let(:raw_params) { %w[1 2] }

  it { is_expected.to define_argument(:width).at(0) }
  it { is_expected.to define_argument(:height).at(1) }

  it_behaves_like 'validates coordinate', :width, 250
  it_behaves_like 'validates coordinate', :height, 250
end
