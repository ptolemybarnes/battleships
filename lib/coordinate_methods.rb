class Integer

  def y
    self
  end

  def x
    self
  end
end

class Integer

  def tickto target
    case self <=> target
    when 1
      return self - 1
    when -1
      return self + 1
    when 0 
      return self
    end
  end

end

class Array

  def tickto target
    self.each_with_index.map do |number, index|
      number.tickto target[index]
    end
  end

end