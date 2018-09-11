require 'spec_helper'

RSpec.describe BitmapEditor::Params::I, type: :param do
  subject { param }

  let(:param) { described_class.new(raw_params) }
  let(:raw_params) { %w[1 2] }


  it { is_expected.to define_argument(:width) }
  it { is_expected.to define_argument(:height) }

  it do
    is_expected.to validate_numericality_of(:width)
                     .is_less_than_or_equal_to(250)
                     .is_greater_than(0)
                     .only_integer
  end
  it do
    is_expected.to validate_numericality_of(:height)
                     .is_less_than_or_equal_to(250)
                     .is_greater_than(0)
                     .only_integer
  end
end
