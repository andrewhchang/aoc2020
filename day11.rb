input = File.read("input.txt").split("\n").map do |i| 
  i.split(//)
end

class NilClass
  def method_missing(*)
    nil
  end
end

def solve(input)
  pass_prev = nil
  pass = input

  while pass != pass_prev
    pass_prev = pass
    pass = pass(pass)
  end
  pass.map { |i| i.count('#') }.reduce(:+)
end

def pass(rows)
  new_rows = []
  (0..rows.length - 1).each do |i|
    new_row = []
    seats = rows[i]
    (0..seats.length - 1).each do |j|
      new_row << calc(i, j, rows)
    end
    new_rows << new_row
  end
  new_rows
end

def calc(row_index, column_index, input)
  if input[row_index][column_index] == 'L'
    if count_adj(row_index, column_index, input, '#') == 0
      return '#'
    else
      return 'L'
    end
  end

  if input[row_index][column_index] == '.'
    return '.' 
  end

  if input[row_index][column_index] == '#'
    if count_adj(row_index, column_index, input, '#') >= 4
      return 'L'
    else
      return '#'
    end
  end
end

def count_adj(row_index, column_index, input, target)
  count = 0
  left_row = row_index - 1 < 0 ? 100000000 : row_index - 1
  down_column = column_index - 1 < 0 ? 100000000 : column_index - 1
  # diag top left
  count += 1 if input[left_row][down_column] == target
  # top
  count += 1 if input[left_row][column_index] == target
  # diag top right
  count += 1 if input[left_row][column_index + 1] == target
  # left
  count += 1 if input[row_index][down_column] == target
  # right
  count += 1 if input[row_index][column_index + 1] == target
  # diag bottom left
  count += 1 if input[row_index + 1][down_column] == target
  # bottom
  count += 1 if input[row_index + 1][column_index] == target
  # diag bottom right
  count += 1 if input[row_index + 1][column_index + 1] == target
  count
end

puts "#{solve(input)}"

# part 2

input = File.read("input.txt").split("\n").map do |i|
  i.split(//)
end

class NilClass
  def method_missing(*)
    nil
  end
end

def solve(input)
  pass_prev = nil
  pass = input

  while pass != pass_prev
    pass_prev = pass
    pass = pass(pass)
    iter += 1
  end
  pass.map { |i| i.count('#') }.reduce(:+)
end

def pass(rows)
  new_rows = []
  (0..rows.length - 1).each do |i|
    new_row = []
    seats = rows[i]
    (0..seats.length - 1).each do |j|
      new_row << calc(i, j, rows)
    end
    new_rows << new_row
  end
  new_rows
end

def calc(row_index, column_index, input)
  if input[row_index][column_index] == 'L'
    if count_adj(row_index, column_index, input, '#') == 0
      return '#'
    else
      return 'L'
    end
  end

  if input[row_index][column_index] == '.'
    return '.'
  end

  if input[row_index][column_index] == '#'
    if count_adj(row_index, column_index, input, '#') >= 5
      return 'L'
    else
      return '#'
    end
  end
end

def count_adj(row_index, column_index, input, target)
  count = 0

  # diag top left
  left_row = row_index - 1 < 0 ? 100000000 : row_index - 1
  down_column = column_index - 1 < 0 ? 100000000 : column_index - 1
  while input[left_row][down_column]
    if input[left_row][down_column] == '#'
      count += 1
      break
    end
    if input[left_row][down_column] == 'L'
      break
    end
    left_row = left_row - 1 < 0 ? 100000000 : left_row - 1
    down_column = down_column - 1 < 0 ? 100000000 : down_column - 1
  end

  # top
  left_row = row_index - 1 < 0 ? 100000000 : row_index - 1
  while input[left_row][column_index]
    if input[left_row][column_index] == '#'
      count += 1
      break
    end
    if input[left_row][column_index] == 'L'
      break
    end
    left_row = left_row - 1 < 0 ? 100000000 : left_row - 1
  end

  # diag top right
  right_column = column_index + 1
  left_row = row_index - 1 < 0 ? 100000000 : row_index - 1
  while input[left_row][right_column]
    if input[left_row][right_column] == '#'
      count += 1
      break
    end
    if input[left_row][right_column] == 'L'
      break
    end
    right_column += 1
    left_row = left_row - 1 < 0 ? 1000000000  : left_row - 1
  end

  # left
  down_column = column_index - 1 < 0 ? 100000000 : column_index - 1
  while input[row_index][down_column]
    if input[row_index][down_column] == '#'
      count += 1
      break
    end
    if input[row_index][down_column] == 'L'
      break
    end
    down_column = down_column - 1 < 0 ? 100000000 : down_column - 1
  end

  # right
  right_column = column_index + 1
  while input[row_index][right_column]
    if input[row_index][right_column] == '#'
      count += 1
      break
    end
    if input[row_index][right_column] == 'L'
      break
    end
    right_column += 1
  end

  # diag bottom left
  top_row = row_index + 1
  down_column = column_index - 1 < 0 ? 100000000 : column_index - 1
  while input[top_row][down_column]
    if input[top_row][down_column] == '#'
      count += 1
      break
    end
    if input[top_row][down_column] == 'L'
      break
    end
    top_row += 1
    down_column = down_column - 1 < 0 ? 100000000 : down_column - 1
  end

  # bottom
  top_row = row_index + 1
  while input[top_row][column_index]
    if input[top_row][column_index] == '#'
      count += 1
      break
    end
    if input[top_row][column_index] == 'L'
      break
    end
    top_row += 1
  end

  # diag bottom right
  top_row = row_index + 1
  right_column = column_index + 1
  while input[top_row][right_column]
    if input[top_row][right_column] == '#'
      count += 1
      break
    end
    if input[top_row][right_column] == 'L'
      break
    end
    top_row += 1
    right_column += 1
  end

  count
end

puts "#{solve(input)}"

