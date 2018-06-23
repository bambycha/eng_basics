require 'rails_helper'

RSpec.describe Fib, type: :model do
  let(:fib) { create(:fib) }

  it 'should be valid factory' do
    expect(fib).to be_valid
  end

  context 'callbacks' do
    describe 'before_save' do
      it 'generates sequence' do
        expect(fib.sequence).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144])
      end

      it 'calcs sum of squares' do
        expect(fib.squares_sum).to eq(33552)
      end
    end
  end

  context 'validations' do
    it { should validate_presence_of(:sequence_length) }
    it { should validate_numericality_of(:sequence_length).is_greater_than(0) }
    it { should validate_uniqueness_of(:sequence_length) }
  end

  describe '#is_known_fib?' do
    context 'when passed a fibonacci number that it has not stored' do
      it 'returns false' do
        expect(fib.is_known_fib?(233)).to be_falsey
      end
    end

    context 'when passed a number that has been stored' do
      it 'returns true' do
        expect(fib.is_known_fib?(144)).to be_truthy
      end
    end
  end

  describe '#all_fibs?' do
    context 'when passed an array of numbers that are all members of the the fibonacci sequence' do
      it 'returns true' do
        expect(fib.all_fibs?([13, 21, 34, 55])).to be_truthy
      end
    end

    context 'when passed an array of numbers that where at least one is not a member of the sequence' do
      it 'returns false' do
        expect(fib.all_fibs?([144, 233, 377])).to be_falsey
      end
    end
  end
end
