module KnightMoves

  KNIGHTMOVES = {
    :upleft => [-1, -2],
    :upright => [-1, 2],
    :downleft => [1, -2],
    :downright => [1, 2],
    :leftup => [-2,-1],
    :leftdown => [-2,1],
    :rightup => [2,-1],
    :rightdown => [2,1]
  }

  def possible_moves
    possible_moves = []

    KNIGHTMOVES.each do |k,v|

      if (board.valid_pos?([@pos[0] + v[0], @pos[1] + v[1]]) &&
        board.grid[@pos[0] + v[0]][@pos[1] + v[1]].color != @color)

        possible_moves << [@pos[0] + v[0], @pos[1] + v[1]]
      end
    end
    possible_moves
  end
end
