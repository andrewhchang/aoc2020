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

# part 2

require 'set'

input = File.read("input.txt").split("\n\n").map do |i|
  i.split(/[\s,\n]/)
end

def solve(input)
  compulsory = Set["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
  input = input.reject(&:empty?)
  valid = 0
  input.each do |i|
    data = {}
    i.each do |j|
      data_point = j.split(":")
      case data_point[0]
      when 'byr'
        if data_point[1].to_i < 1920 || data_point[1].to_i > 2002
          next
        end
      when 'iyr'
        if data_point[1].to_i < 2010 || data_point[1].to_i > 2020
          next
        end
      when 'eyr'
        if data_point[1].to_i < 2020 || data_point[1].to_i > 2030
          next
        end
      when 'hgt'
        if data_point[1][-2..-1] == "cm"
          if data_point[1][0..-3].to_i < 150 || data_point[1][0..-3].to_i > 193
            next
          end
        else
          if data_point[1][0..-3].to_i < 59 || data_point[1][0..-3].to_i > 76
            next
          end
        end
      when 'hcl'
        if !data_point[1].match(/(?<=#)(?<!^)(\h{6})/)
          next
        end
      when 'ecl'
        if data_point[1].chars.count() != 3 || ![data_point[1]].to_set.subset?(Set["amb", "blu", "brn", "gry", "grn", "hzl", "oth"])
          next
        end
      when 'pid'
        if !data_point[1].match(/^\d{9}$/)
          next
        end
      end
      data[data_point[0]] = true
    end
    if compulsory.subset?((data.keys).to_set)
      valid += 1
    end
  end
  valid
end

puts "#{solve(input)}"
