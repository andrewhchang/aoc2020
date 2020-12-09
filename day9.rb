input = File.read("input.txt").split("\n").map do |i| 
  i.to_i
end

def solve(input)
  start_index = 0
  found = {}
  current_number = nil
  while input[start_index + 26]
    goal = input[start_index + 26]
    invalid_state = true
    (start_index..start_index+25).each do |i|
      complement = goal - input[i]
      if found[complement]
        found[input[start_index]] = false
        start_index +=1 
        invalid_state = false
        break
      else
        found[input[i]] = true
      end
    current_number = goal
    end
    if (invalid_state)
      break
    end
  end
  current_number
end

puts "#{solve(input)}"


# part 2
input = File.read("input.txt").split("\n").map do |i| 
  i.to_i
end

def solve(input)
  goal = 88311122
  sum = input[0]
  left_index = 0
  right_index = 0

  loop do
    if sum < goal
      right_index += 1
      sum += input[right_index]
    end

    if sum > goal
      sum -= input[left_index]
      left_index += 1
    end

    if sum == goal
      return input[left_index..right_index].max + input[left_index..right_index].min
    end
  end
end

