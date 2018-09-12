# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor::Params::L, type: :param do
  subject { param }

  let(:param) { described_class.new(raw_params, bitmap) }
  let(:raw_params) { %w[1 1 C] }
  let(:bitmap) { BitmapEditor::Bitmap.new(2, 3) }


  it { is_expected.to define_argument(:x) }
  it { is_expected.to define_argument(:y) }
  it { is_expected.to define_argument(:color) }

  it_behaves_like 'validates coordinate', :x, 2
  it_behaves_like 'validates coordinate', :y, 3
  it_behaves_like 'validates color'
end
