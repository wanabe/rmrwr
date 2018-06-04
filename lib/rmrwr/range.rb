module Rmrwr::Range
  def each
    unless block_given?
      return to_enum(:each, &:size)
    end

    if first.is_a?(Integer) && last.is_a?(Integer)
      i, lim = first, last
      unless exclude_end?
        lim += 1
      end
      while i < lim
        yield i
        i += 1
      end
    else
      super # TODO
    end
    self
  end
end

class ::Range
  prepend Rmrwr::Range
end

