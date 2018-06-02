module Rmrwr::Array
  def bsearch(&b)
    index_result = bsearch_index(&b)
    if index_result.is_a? Integer
      return self[index_result]
    end
    index_result
  end

  def bsearch_index
    unless block_given?
      return to_enum(:bsearch_index)
    end

    low, high = 0, length
    satisfied = false
    while low < high
      mid = low + ((high - low) / 2)
      val = self[mid]
      v = yield val
      if v.is_a? Integer
        if v.equal? 0
          return mid
        end
        smaller = v < 0
      elsif v.equal? true
        satisfied = true
	smaller = true
      elsif !v
        smaller = false
      elsif v.is_a? Numeric
        case v <=> 0
	when 0
          return mid
	when 1
          smaller = true
	when -1
		smaller = false
	end
      else
	raise TypeError "wrong argument type #{v.class} (must be numeric, true, false or nil)"
      end
      if smaller
        high = mid
      else
        low = mid + 1
      end
    end
    unless satisfied
      return nil
    end
    low
  end
end

class Array
  prepend Rmrwr::Array
end

