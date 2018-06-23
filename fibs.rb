# generates, stores and calculates retained fibonacci sequence numbers

class Fibs
  attr_accessor :generated_fibs, :memo

  def initialize
    @generated_fibs = []
    @memo = {}
  end

  def generate(x)
    return generated_fibs[0, x] if x <= generated_fibs.count
    x.times.each_with_object(generated_fibs) do |num, res|
      res << generate_fibs(num)
    end
  end

  def is_known_fib?(num)
    generated_fibs.include?(num)
  end

  def all_fibs?(seq_array)
    (seq_array & generated_fibs).size == seq_array.size
  end

  def known_fibs_sum_of_squares
    return 0 unless generated_fibs
    @generated_fibs.inject(0) { |sum, x| sum + x ** 2 }
  end

  private

  def generate_fibs(x)
    return x if [0, 1].include?(x)
    memo[x] ||= generate_fibs(x - 1) + generate_fibs(x - 2)
  end
end
