module PawnMoves

  ATTACKS = {
    :attackleft => [-1,-1],
    :attackright => [-1,1]
  }

  def possible_moves
    possible_moves = []
    if color == 'white'
      if @pos[0] == 6
        if (board.valid_pos?([@pos[0]-2, @pos[1]]) && board.grid[@pos[0]-1][@pos[1]].class == NullPiece &&
          board.grid[@pos[0]-2][@pos[1]].class == NullPiece)
          possible_moves << [@pos[0]-2, @pos[1]]
        end
      end
      if board.valid_pos?([@pos[0]-1, @pos[1]]) && board.grid[@pos[0]-1][@pos[1]].class == NullPiece
        possible_moves << [@pos[0]-1, @pos[1]]
      end
      ATTACKS.each do |k,v|
        if board.valid_pos?([@pos[0]+v[0], @pos[1]+v[1]]) && board.grid[@pos[0]+v[0]][@pos[1]+v[1]].color == 'black'
          possible_moves << [@pos[0]+v[0], @pos[1]+v[1]]
        end
      end
    else
      if @pos[0] == 1
        if (board.valid_pos?([@pos[0]+2, @pos[1]]) && board.grid[@pos[0]+1][@pos[1]].class == NullPiece &&
          board.grid[@pos[0]+2][@pos[1]].class == NullPiece)
          possible_moves << [@pos[0]+2, @pos[1]]
        end
      end
      if board.valid_pos?([@pos[0]+1, @pos[1]]) && board.grid[@pos[0]+1][@pos[1]].class == NullPiece
        possible_moves << [@pos[0]+1, @pos[1]]
      end
      ATTACKS.each do |k,v|
        if board.valid_pos?([@pos[0]-v[0], @pos[1]-v[1]]) && board.grid[@pos[0]-v[0]][@pos[1]-v[1]].color == 'white'
          possible_moves << [@pos[0]-v[0], @pos[1]-v[1]]
        end
      end
    end
    possible_moves
  end

end
