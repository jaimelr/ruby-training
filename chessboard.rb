def optimal_bishop_move(start_position, end_position)
  chessboard = (1..64).each_slice(8).to_a
  return 'Not a valid number' if chessboard.include? start_position

  move_count = 0
  inc = 1

  coords = get_coordinates chessboard, start_position

  move_count = cross_scan(chessboard, coords, end_position, move_count)
  return move_count if move_count > 0

  # Scan bottom-right
  while coords[:y] + inc < 7 && coords[:x] + inc < 7
    move_count += 1
    temp_position = chessboard[coords[:y] + inc][coords[:x] + inc]
    inc += 1
    temp_cords = get_coordinates chessboard, temp_position
    move_count += cross_scan(chessboard, temp_cords, end_position, move_count)
    return move_count if move_count > inc
  end

  move_count = 0
  inc = 1

  # Scan bottom-left
  while coords[:y] + inc < 8 && coords[:x] - inc >= 0
    move_count += 1
    temp_position = chessboard[coords[:y] + inc][coords[:x] - inc]
    inc += 1
    temp_cords = get_coordinates chessboard, temp_position
    move_count += cross_scan(chessboard, temp_cords, end_position, move_count)
    return move_count if move_count > inc
  end

  move_count = 0
  inc = 1

  # Scan top-left
  while coords[:y] - inc >= 0 && coords[:x] - inc >= 0
    move_count += 1
    temp_position = chessboard[coords[:y] - inc][coords[:x] - inc]
    inc += 1
    temp_cords = get_coordinates chessboard, temp_position
    move_count += cross_scan(chessboard, temp_cords, end_position, move_count)
    return move_count if move_count > inc
  end

  move_count = 0
  inc = 1

  # Scan top-right
  while coords[:y] - inc >= 0 && coords[:x] + inc >= 0
    move_count += 1
    temp_position = chessboard[coords[:y] - inc][coords[:x] + inc]
    inc += 1
    temp_cords = get_coordinates chessboard, temp_position
    move_count += cross_scan(chessboard, temp_cords, end_position, move_count)
    return move_count if move_count > inc
  end
end

def get_coordinates chessboard, start_position
  index = chessboard.flatten.index(start_position)
  coords = {}
  coords[:y] = index / 8
  coords[:x] = index % 8
  coords
end

def cross_scan chessboard, coords, end_position, move_count
  inc = 0

  # Search bottom-right
  while coords[:y] + inc < 8 && coords[:x] + inc < 8
    move_count += 1
    return move_count if chessboard[coords[:y] + inc][coords[:x] + inc] == end_position
    inc += 1
  end

  inc = 0
  move_count = 0

  # Search top-left
  while coords[:y] - inc >= 0 && coords[:x] - inc >= 0
    move_count += 1
    return move_count if chessboard[coords[:y] - inc][coords[:x] - inc] == end_position
    inc += 1
  end

  inc = 0
  move_count = 0

  # Search top-right
  while coords[:y] - inc >= 0 && coords[:x] + inc < 8
    move_count += 1
    return move_count if chessboard[coords[:y] - inc][coords[:x] + inc] == end_position
    inc += 1
  end

  inc = 0
  move_count = 0

  # Search bottom-left
  while coords[:y] + inc < 8 && coords[:x] - inc >= 0
    move_count += 1
    return move_count if chessboard[coords[:y] + inc][coords[:x] - inc] == end_position
    inc += 1
  end

  move_count = 0

  return move_count
end

puts optimal_bishop_move(30, 5) - 1
