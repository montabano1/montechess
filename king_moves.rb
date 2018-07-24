module KingMoves

  KINGMOVES = {
    :upleft => [-1, -1],
    :upright => [-1, 1],
    :downleft => [1, -1],
    :downright => [1, 1],
    :left => [0,-1],
    :right => [0,1],
    :up => [-1,0],
    :down => [1,0]
  }

  def possible_moves
    possible_moves = []

    KINGMOVES.each do |k,v|

      if (board.valid_pos?([@pos[0] + v[0], @pos[1] + v[1]]) &&
        board.grid[@pos[0] + v[0]][@pos[1] + v[1]].color != @color)

        possible_moves << [@pos[0] + v[0], @pos[1] + v[1]]
      end
    end
    possible_moves
  end
end
