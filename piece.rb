class Piece
  attr_reader :grid, :value, :type, :board, :color, :pos, :name

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    @type = []
    @name
  end

  def to_s
    p @value
  end

  def pos=(val)
    @pos = val
  end

  def move_into_check?(end_pos)

  end

  def opposite_color
    if @color == 'white'
      return 'black'
    elsif @color == 'black'
      return 'white'
    else
      return 'gray'
    end
  end
end


class NullPiece
  attr_reader :value, :color

  def initialize
    @value = ' '
    @color = 'gray'
    @pos = nil
  end

  def possible_moves
    [[]]
  end

  def pos=(val)
    @pos = val
  end

end
