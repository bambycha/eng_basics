# frozen_string_literal: true

# generates, stores and calculates retained fibonacci sequence numbers

class Fibs
  def initialize
    @generated_fibs = []
  end

  attr_reader :generated_fibs

  def generate(x)
    return generated_fibs[0, x] if generated_fibs.size >= x

    generate_fibs(x)
  end

  def is_known_fib?(num)
    generated_fibs.include?(num)
  end

  def all_known_fibs?(seq_array)
    seq_array.all?(&method(:is_known_fib?))
  end

  def all_fibs?(seq_array)
    seq_array.all? do |number|
      n = 5 * number * number

      perfect_square?(n + 4) || perfect_square?(n - 4)
    end
  end

  def known_fibs_sum_of_squares
    return 0 if generated_fibs.empty?

    generated_fibs.last * generated_fibs.last(2).inject(:+)
  end

  private

  def generate_fibs(x)
    generated_fibs.tap do |sequence|
      sequence << last_two_items(sequence).inject(:+) while sequence.size < x
    end
  end

  def last_two_items(seq)
    seq.size < 2 ? seq << 0 && [0, 1] : seq.last(2)
  end

  def perfect_square?(number)
    Math.sqrt(number) % 1 == 0
  end
end
