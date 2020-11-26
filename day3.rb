input = File.read("input.txt").split("\n").map do |i| 
  i.split(//)
end

def solve(input)
  down_step = [1, 1, 1, 1, 2]
  right_step = [1, 3, 5, 7, 1]
  tree_list = []
  (0..4).each do |j|
    current_index = 0
    trees = 0
    (0..input.length - 1).step(down_step[j]).each do |i|
      if input[i][current_index] == '#'
        trees += 1
      end
      if (current_index + right_step[j]) > (input[i].length - 1)
        current_index = (current_index + right_step[j]) - (input[i].length)
      else
        current_index += right_step[j]
      end
    end
    tree_list.append(trees)
  end
  tree_list.reduce(:*)
end

puts "#{solve(input)}"
