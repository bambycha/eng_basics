class Fib < ApplicationRecord
  attr_writer :cache
  serialize :sequence

  before_save :generate_sequence
  before_save :calc_squares_sum

  validates :sequence_length, presence: true, uniqueness: true
  validates_numericality_of :sequence_length, greater_than: 0

  def cache
    @cache ||= {}
  end

  def generate_sequence
    return [] unless sequence_length
    self.sequence = sequence_length.times.each_with_object([]) do |num, res|
      res << generate_fibs(num)
    end
  end

  def is_known_fib?(num)
    sequence.include?(num)
  end

  def all_fibs?(seq_array)
    (seq_array & sequence).size == seq_array.size
  end

  def calc_squares_sum
    return 0 unless sequence
    self.squares_sum = sequence.inject(0) { |sum, x| sum + x ** 2 }
  end

  private

  def generate_fibs(x)
    return x if [0, 1].include?(x)
    cache[x] ||= generate_fibs(x - 1) + generate_fibs(x - 2)
  end
end
