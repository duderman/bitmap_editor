require 'spec_helper'

RSpec.describe BitmapEditor::Bitmap do
  describe '::[]=' do
    subject { bitmap[1, 1] = 'C' }

    let(:bitmap) { BitmapEditor::Bitmap.new(2, 2) }

    it 'sets element to specified value' do
      expect { subject }.to change { bitmap.data[1][1] }.to('C')
    end
  end
end
