# frozen_string_literal: true

RSpec.shared_examples 'validates color' do |argument, max|
  it { is_expected.to allow_value('B').for(:color) }
  it { is_expected.not_to allow_value('BB').for(:color) }
  it { is_expected.not_to allow_value('b').for(:color) }
end


