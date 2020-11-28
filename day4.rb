require 'set'

input = File.read("test.txt").split("\n\n").map do |i| 
  i.split(/[\s,\n]/)
end

def solve(input)
  compulsory = Set["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
  input = input.reject(&:empty?)
  valid = 0
  input.each do |i|
    data = {}
    i.each do |j|
      data[j.split(":")[0]] = true
    end
    if compulsory.subset?((data.keys).to_set)
      valid += 1
    end
  end
  valid
end

puts "#{solve(input)}"
