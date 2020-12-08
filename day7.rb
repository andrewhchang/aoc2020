input = File.read("input.txt").split("\n").map do |i| 
  data = i.split(' ')
  rule = {}
  (4..data.length - 1).each do |j|
    colour = "#{data[0]} #{data[1]}"
    if data.include?("other")
      rule[colour] = nil
    else
      begin
        count = Integer(data[j])
        if rule[colour]
          rule[colour].append(["#{data[j+1]} #{data[j+2]}", count])
        else
          rule[colour] = [["#{data[j+1]} #{data[j+2]}", count]]
        end
      rescue ArgumentError
        next
      end
    end
  end
  rule
end

def solve(input)
  rules = input.reduce({}, :merge)
  temp = find_parents(rules, ["shiny gold"])
  parents = []
  parents << temp
  while !temp.empty?
    temp = find_parents(rules, temp)
    parents << temp
  end
  puts parents.flatten.uniq.count
end

def find_parents(input, children)
  all_colours = input.keys
  parents = []
  children.each do |child|
    all_colours.each do |colour|
      if !input[colour]
        next
      end
      input[colour].each do |rule|
        if rule.include?(child)
          parents << colour
        end
      end
    end
  end
  parents
end

puts "#{solve(input)}

# part 2

input = File.read("input.txt").split("\n").map do |i| 
  data = i.split(' ')
  rule = {}
  (4..data.length - 1).each do |j|
    colour = "#{data[0]} #{data[1]}"
    if data.include?("other")
      rule[colour] = nil
    else
      begin
        count = Integer(data[j])
        if rule[colour]
          rule[colour].append(["#{data[j+1]} #{data[j+2]}", count])
        else
          rule[colour] = [["#{data[j+1]} #{data[j+2]}", count]]
        end
      rescue ArgumentError
        next
      end
    end
  end
  rule
end

def solve(input)
  rules = input.reduce({}, :merge)
  temp = find_children(rules, "shiny gold", 1)
end

def find_children(input, bag_colour, quantity)
  bags_inside = input[bag_colour]

  if !bags_inside
    return quantity
  end

  total_children = 0

  bags_inside.each do |bag|
    total_children += bag[1] * quantity
    if input[bag[0]]
      total_children += quantity * find_children(input, bag[0], bag[1])
    end
  end
  total_children
end

puts "#{solve(input)}"
