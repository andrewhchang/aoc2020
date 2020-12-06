input = File.read("input.txt").split("\n\n").map do |i| 
  i.split("\n").map { |i| i.split(//) }.flatten.uniq
end

def solve(input)
  return input.map { |i| i.length }.reduce(:+)
end

puts "#{solve(input)}}
