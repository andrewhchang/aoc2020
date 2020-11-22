input = File.read("input.txt").split("\n").map do |i| 
  comp = i.split(' ')
  rule = comp[0].split('-')
  { "min" => rule[0], "max" => rule[1], "letter" => comp[1][0], "password" => comp[2] }
end

def solve(input)
  valid = 0
  input.each do |entry|
    count = entry["password"].count(entry["letter"])
    if count.between?(entry["min"].to_i, entry["max"].to_i)
      valid += 1
    end
  end
  valid
end

puts "#{solve(input)}"
