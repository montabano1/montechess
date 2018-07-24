module SlidingPiece
  MOVES = {
    :upleft => [-1, -1],
    :upright => [-1, 1],
    :downleft => [1, -1],
    :downright => [1, 1],
    :down => [1,0],
    :up => [-1,0],
    :left => [0,-1],
    :right => [0,1]
  }

  def possible_moves
    possible_moves = []
    if type.include?(:diag)

      ul_or_dr = []

      #moving up and left
      cur_pos = [@pos[0] + MOVES[:upleft][0], @pos[1] + MOVES[:upleft][1]]
      while (board.valid_pos?(cur_pos) &&
        board.grid[cur_pos[0]][cur_pos[1]].class == NullPiece)
          ul_or_dr << cur_pos
          cur_pos = [cur_pos[0] + MOVES[:upleft][0], cur_pos[1] + MOVES[:upleft][1]]
      end
      if board.valid_pos?(cur_pos)
        if board.grid[cur_pos[0]][cur_pos[1]].color != @color
          ul_or_dr << cur_pos
        end
      end

      #moving down and right
      cur_pos = [@pos[0] + MOVES[:downright][0], @pos[1] + MOVES[:downright][1]]
      while (board.valid_pos?(cur_pos) &&
        board.grid[cur_pos[0]][cur_pos[1]].class == NullPiece)
          ul_or_dr << cur_pos
          cur_pos = [cur_pos[0] + MOVES[:downright][0], cur_pos[1] + MOVES[:downright][1]]
      end
      if board.valid_pos?(cur_pos)
        if board.grid[cur_pos[0]][cur_pos[1]].color != @color
          ul_or_dr << cur_pos
        end
      end

      ur_or_dl = []

      #moving down and left
      cur_pos = [@pos[0] + MOVES[:downleft][0], @pos[1] + MOVES[:downleft][1]]
      while (board.valid_pos?(cur_pos) &&
        board.grid[cur_pos[0]][cur_pos[1]].class == NullPiece)
          ul_or_dr << cur_pos
          cur_pos = [cur_pos[0] + MOVES[:downleft][0], cur_pos[1] + MOVES[:downleft][1]]
      end
      if board.valid_pos?(cur_pos)
        if board.grid[cur_pos[0]][cur_pos[1]].color != @color
          ul_or_dr << cur_pos
        end
      end

      #moving up and right
      cur_pos = [@pos[0] + MOVES[:upright][0], @pos[1] + MOVES[:upright][1]]
      while (board.valid_pos?(cur_pos) &&
        board.grid[cur_pos[0]][cur_pos[1]].class == NullPiece)
          ul_or_dr << cur_pos
          cur_pos = [cur_pos[0] + MOVES[:upright][0], cur_pos[1] + MOVES[:upright][1]]
      end
      if board.valid_pos?(cur_pos)
        if board.grid[cur_pos[0]][cur_pos[1]].color != @color
          ul_or_dr << cur_pos
        end
      end

      possible_moves << ur_or_dl
      possible_moves << ul_or_dr
    end

    if type.include?(:straight)

      up_or_down = []

      #moving up
      cur_pos = [@pos[0] + MOVES[:up][0], @pos[1]]
      while (board.valid_pos?(cur_pos) &&
        board.grid[cur_pos[0]][cur_pos[1]].class == NullPiece)
          up_or_down << cur_pos
          cur_pos = [cur_pos[0] + MOVES[:up][0], cur_pos[1]]
      end
      if board.valid_pos?(cur_pos)
        if board.grid[cur_pos[0]][cur_pos[1]].color != @color
          up_or_down << cur_pos
        end
      end

      #moving down and right
      cur_pos = [@pos[0] + MOVES[:down][0], @pos[1]]
      while (board.valid_pos?(cur_pos) &&
        board.grid[cur_pos[0]][cur_pos[1]].class == NullPiece)
          up_or_down << cur_pos
          cur_pos = [cur_pos[0] + MOVES[:down][0], cur_pos[1]]
      end
      if board.valid_pos?(cur_pos)
        if board.grid[cur_pos[0]][cur_pos[1]].color != @color
          up_or_down << cur_pos
        end
      end

      left_or_right = []

      #moving left
      cur_pos = [@pos[0], @pos[1] + MOVES[:left][1]]
      while (board.valid_pos?(cur_pos) &&
        board.grid[cur_pos[0]][cur_pos[1]].class == NullPiece)
          left_or_right << cur_pos
          cur_pos = [cur_pos[0], cur_pos[1] + MOVES[:left][1]]
      end
      if board.valid_pos?(cur_pos)
        if board.grid[cur_pos[0]][cur_pos[1]].color != @color
          left_or_right << cur_pos
        end
      end

      #moving up and right
      cur_pos = [@pos[0], @pos[1] + MOVES[:right][1]]
      while (board.valid_pos?(cur_pos) &&
        board.grid[cur_pos[0]][cur_pos[1]].class == NullPiece)
          left_or_right << cur_pos
          cur_pos = [cur_pos[0], cur_pos[1] + MOVES[:right][1]]
      end
      if board.valid_pos?(cur_pos)
        if board.grid[cur_pos[0]][cur_pos[1]].color != @color
          left_or_right << cur_pos
        end
      end

      possible_moves << left_or_right
      possible_moves << up_or_down
    end
    possible_moves.flatten(1).uniq
  end
end
