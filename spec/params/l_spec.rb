require 'spec_helper'

RSpec.describe BitmapEditor::Params::L, type: :param do
  subject { param }

  let(:param) { described_class.new(raw_params, bitmap) }
  let(:raw_params) { %w[1 1 C] }
  let(:bitmap) { BitmapEditor::Bitmap.new(2, 3) }


  it { is_expected.to define_argument(:x) }
  it { is_expected.to define_argument(:y) }
  it { is_expected.to define_argument(:color) }

  it do
    is_expected.to validate_numericality_of(:x)
                     .is_less_than_or_equal_to(2)
                     .is_greater_than(0)
                     .only_integer
  end
  it do
    is_expected.to validate_numericality_of(:y)
                     .is_less_than_or_equal_to(3)
                     .is_greater_than(0)
                     .only_integer
  end
  it { is_expected.to allow_value("B").for(:color) }
  it { is_expected.not_to allow_value("BB").for(:color) }
  it { is_expected.not_to allow_value("b").for(:color) }
end
