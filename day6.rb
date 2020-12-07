input = File.read("input.txt").split("\n\n").map do |i| 
  i.split("\n").map { |i| i.split(//) }.flatten.uniq
end

def solve(input)
  return input.map { |i| i.length }.reduce(:+)
end

puts "#{solve(input)}}

# part 2

input = File.read("input.txt").split("\n\n").map do |i|
  i.split("\n").map { |j| j.split(//) }
end

def solve(input)
  ans = input.map do |i|
    i.inject { |j, k| j & k}.length
  end
  ans.reduce(:+)
end

puts "#{solve(input)}"
