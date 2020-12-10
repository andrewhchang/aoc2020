input = File.read("input.txt").split("\n").map do |i| 
  i.to_i
end

def solve(input)
  jolts = input.sort << (input.max + 3)
  effective_rating = 0
  one, two, three = [],[],[]
  (0..jolts.length - 1).each do |i|
    difference = jolts[i] - effective_rating
    case difference
    when 1
      one << jolts[i]
    when 2
      two << jolts[i]
    when 3
      three << jolts[i]
    end
    effective_rating += difference
  end
  one.length * three.length
end

puts "#{solve(input)}"

# part 2

require 'set'

input = File.read("input.txt").split("\n").map do |i|
  i.to_i
end

def solve(input)
  jolts = input.to_set
  sums = {}
  find_combos(0, jolts, jolts.max, sums)
end

def find_combos(current_index, adapters, max, sums)
  return 1 if current_index == max
  if !sums.has_key?(current_index)
    possible = []
    possible.push(find_combos(current_index+1, adapters, max, sums)) if adapters.include?(current_index+1)
    possible.push(find_combos(current_index+2, adapters, max, sums)) if adapters.include?(current_index+2)
    possible.push(find_combos(current_index+3, adapters, max, sums)) if adapters.include?(current_index+3)
    sums[current_index] = possible.sum
 end
  return sums[current_index]
end

puts "#{solve(input)}"
