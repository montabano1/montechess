class Piece
  attr_reader :grid, :value, :type, :board, :color, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    @type = []
  end

  def empty?

  end

  def to_s
    p @value
  end

  def valid_moves

  end

  def pos=(val)
    @pos = val
  end

  def move_into_check?(end_pos)

  end


end


class NullPiece 
  attr_reader :value, :color

  def initialize
    @value = ' '
    @color = 'gray'
  end

  def possible_moves
    [[]]
  end

end
