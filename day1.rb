input = File.read("input.txt").split.map { |i| i.to_i }

# Part 2
def find_three(input, goal)
  seen = {}
  input.each do |i|
    three_goal = goal - i
    ans = find_pair(three_goal, seen, input)
    if ans
      return [ans, i].flatten.reduce(&:*)
    end
  end
  nil
end

# Part 1
def find_pair(goal, seen, input)
  input.each do |i|
    match = goal - i
    if seen[match]
      return [match, i]
    else
      seen[i] = true
    end
  end
  nil
end

puts solve(input, 2020)
