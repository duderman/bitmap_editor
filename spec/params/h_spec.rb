# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BitmapEditor::Params::H, type: :param do
  subject { param }

  let(:param) { described_class.new(raw_params, bitmap) }
  let(:raw_params) { %w[1 1 2 C] }
  let(:bitmap) { BitmapEditor::Bitmap.new(2, 3) }


  it { is_expected.to define_argument(:y) }
  it { is_expected.to define_argument(:x1) }
  it { is_expected.to define_argument(:x2) }
  it { is_expected.to define_argument(:color) }

  it_behaves_like 'validates coordinate', :y, 3
  it_behaves_like 'validates coordinate', :x1, 2
  it_behaves_like 'validates coordinate', :x2, 2
  it_behaves_like 'validates color'
end
