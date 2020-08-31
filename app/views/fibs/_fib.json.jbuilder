json.extract! fib, :id, :created_at, :sequence_length, :squares_sum,
  :updated_at, :sequence
json.url fib_url(fib, format: :json)
