input = File.read("input.txt").split("\n").map do |i| 
  i
end

def solve(input)
  ids = []
  input.each do |i|
    row_code = i[0..6]
    col_code = i[7..9]
    row = [0, 127]
    col = [0, 7]
    
    row_code.each_char do |i|
      row = half(i, row)
    end

    col_code.each_char do |i|
      col = half(i, col)
    end

    ids.append(row[0]*8 + col[0])
  end
  return ids.max
end

def half(letter, current_half)
  if letter == 'F' || letter == 'L'
    return [current_half[0],  ((current_half[1] - 1) - current_half[0])/2 + current_half[0]]
  elsif letter == 'B' || letter == 'R'
    return [((current_half[1] + 1) - current_half[0])/2 + current_half[0], current_half[1]]
  end
end

puts "#{solve(input)}"

