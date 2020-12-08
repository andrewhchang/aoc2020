input = File.read("input2.txt").split("\n").map do |i| 
  j = i.split(" ")
  { j[0] => j[1].to_i }
end

def solve(input)
  acc = { "value" => 0 }
  current_index = 0
  seen_indexes = { }
  
  while !seen_indexes[current_index]
    seen_indexes[current_index] = true
    current_index = parse(current_index, input, acc)
  end

  acc["value"]
end

def parse(current_index, input, acc)
  instruction = input[current_index]
  case instruction.keys[0]
  when 'jmp'
    return current_index + instruction.values[0]
  when 'acc'
    acc["value"] += instruction.values[0]
    return current_index + 1
  when 'nop'
    return current_index + 1
  end
end

# part 2

input = File.read("input2.txt").split("\n").map do |i|
  j = i.split(" ")
  { j[0] => j[1].to_i }
end

def solve(input)
  acc = { "value" => 0 }
  current_index = 0
  seen_indexes = { }
  copy = Marshal.load(Marshal.dump(input))
  new_input = Marshal.load(Marshal.dump(copy))

  (0..input.length - 1).each do |index|
    new_input = Marshal.load(Marshal.dump(copy))

    if new_input[index].keys[0] == "jmp"
      new_input[index]["nop"] = new_input[index].delete("jmp")
    elsif new_input[index].keys[0] == "nop"
      new_input[index]["jmp"] = new_input[index].delete("nop")
    end

    if check_combo(new_input)[0]
      return [index, check_combo[1]]
    end
  end
end

def check_combo(input)
  seen_indexes = {}
  current_index = 0
  acc = { "value" => 0 }

  loop do
    if current_index == input.length - 1
      current_index = parse(current_index, input, acc)
      return [true, acc]
    end
    if seen_indexes[current_index]
      return [false, acc]
    end
    seen_indexes[current_index] = true
    current_index = parse(current_index, input, acc)
  end
end

def parse(current_index, input, acc)
  instruction = input[current_index]
  case instruction.keys[0]
  when 'jmp'
    return current_index + instruction.values[0]
  when 'acc'
    acc["value"] += instruction.values[0]
    return current_index + 1
  when 'nop'
    return current_index + 1
  end
end

puts "#{solve(input)}
