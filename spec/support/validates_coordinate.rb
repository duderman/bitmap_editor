# frozen_string_literal: true

RSpec.shared_examples 'validates coordinate' do |argument, max|
  it do
    is_expected.to validate_numericality_of(argument)
      .is_greater_than(0)
      .only_integer
  end
  it { is_expected.to allow_value(max).for(argument) }
  it do
    is_expected.not_to allow_value(max + 1)
      .for(argument)
      .with_message('is bigger than bitmap')
  end
end
