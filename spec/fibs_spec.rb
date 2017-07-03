# frozen_string_literal: true

require 'pry'
require 'fibs'

RSpec.describe Fibs do
  subject { Fibs.new }

  describe '#generate' do
    let(:expected_result) { [0, 1, 1, 2, 3, 5, 8, 13, 21, 34] }

    it 'returns the number of requested fibonacci numbers' do
      expect(subject.generate(10)).to eq(expected_result)

      expect(subject.generate(3)).to eq([0, 1, 1])
      expect(subject.generate(2)).to eq([0, 1])
      expect(subject.generate(1)).to eq([0])
      expect(subject.generate(0)).to eq([])
      expect(subject.generate(-10)).to eq(nil)
    end

    it 'stores the values' do
      subject.generate(10)

      expect(subject.generated_fibs).to eq(expected_result)
    end

    context 'when it already knows the requested number of sequence numbers' do
      before do
        subject.generate(5)

        allow_any_instance_of(Fibs).to receive(:generate_fibs) { raise Exception }
      end

      it 'does not call generate_fibs' do
        expect { subject.generate(3) }.to_not raise_error(Exception)
        expect { subject.generate(5) }.to_not raise_error(Exception)
        expect { subject.generate(6) }.to raise_error(Exception)
      end
    end
  end

  describe '#is_known_fib?' do
    before(:each) do
      subject.generate(2)
    end

    context 'when passed a fibonacci number that it has not stored' do
      it 'returns false' do
        expect(subject.is_known_fib?(2)).to eq false
      end
    end

    context 'when passed a number that has been stored' do
      it 'returns true' do
        expect(subject.is_known_fib?(1)).to eq true
      end
    end
  end

  describe '#all_known_fibs?' do
    before(:each) do
      subject.generate(3)
    end

    context 'when passed an array of numbers that are all members of the stored fibonacci sequence' do
      it 'returns true' do
        expect(subject.all_known_fibs?([0, 1, 1])).to eq true
        expect(subject.all_known_fibs?([1, 1])).to eq true
        expect(subject.all_known_fibs?([0])).to eq true
      end
    end

    context 'when passed an array of numbers that where at least one is not a member of the stored sequence' do
      it 'returns false' do
        expect(subject.all_known_fibs?([0, 1, 2])).to eq false
        expect(subject.all_known_fibs?([2])).to eq false
      end
    end
  end

  describe '#all_fibs?' do
    context 'when passed an array of numbers that are all members of the fibonacci sequence' do
      it 'returns true' do
        expect(subject.all_fibs?([0, 1, 1])).to eq true
        expect(subject.all_fibs?([1, 1])).to eq true
        expect(subject.all_fibs?([0])).to eq true
      end
    end

    context 'when passed an array of numbers that where at least one is not a member of the sequence' do
      it 'returns false' do
        expect(subject.all_fibs?([0, 1, 6])).to eq false
        expect(subject.all_fibs?([7])).to eq false
      end
    end
  end

  describe '#known_fibs_sum_of_squares' do
    let(:expected_result) { [0, 1, 1, 2, 3, 5, 8, 13, 21, 34].map { |n| n**2 }.reduce(:+) }

    context 'when there are stored numbers' do
      before do
        subject.generate(10)
      end

      it 'returns the sum of the squared values for all known fibs' do
        expect(subject.known_fibs_sum_of_squares).to eq(expected_result)
      end
    end

    context 'when there are no stored numbers' do
      it 'returns 0' do
        expect(subject.known_fibs_sum_of_squares).to eq(0)
      end
    end
  end
end
