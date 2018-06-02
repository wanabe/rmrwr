module Rmrwr::Integer
  def times
    unless block_given?
      return to_enum(:times, &:itself)
    end

    i = 0
    while self > i
      yield i
      i += 1
    end
    self
  end
end

class Integer
  prepend Rmrwr::Integer
end

