def is_geometric?(seq)
  r = seq.last.quo(seq[-2])
  (1..(seq.length - 1)).each {|idx|
    if (seq[idx].quo(seq[idx-1]) != r)
      return false
    end
  }
  return true
end

def fibonacci?(num)
  limit_count = 1000000
  n0 = 0
  n1 = 1
  current = 0
  (2..limit_count).each do
    current = n0 + n1
    if current == num
      return true
    elsif current > num
      return false
    end

    n0 = n1
    n1 = current
  end

  return false
end

def is_fibonacci?(seq)
  return false if !fibonacci?(seq[0])
  return false if !fibonacci?(seq[1])

  (2..(seq.length - 1)).each {|idx|
    if ((seq[idx - 2] + seq[idx - 1]) != seq[idx])
      return false
    end
  }
  return true
end

def is_arithmetic?(seq)
  diff = seq[1] - seq[0]
  (2..(seq.length - 1)).each {|idx|
    if ((seq[idx] - seq[idx - 1]) != diff)
      return false
    end
  }
  return true
end

pattern = [
  {:method => self.method(:is_geometric?), :code => "G"},
  {:method => self.method(:is_arithmetic?), :code => "A"},
  {:method => self.method(:is_fibonacci?), :code => "F"}
]

input_sequence = gets.chomp.upcase.split(" ")
input_sequence.map! {|num| num.to_i }

result = "x"
pattern.each_with_index{|pat, idx|
  if pat[:method].call(input_sequence) == true
    result = pat[:code]
    break
  end
}
printf("%c", result[0])
