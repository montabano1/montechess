require_relative 'piece.rb'
require_relative 'knight_moves'

class Knight < Piece
  include KnightMoves
  def initialize(color, board, pos)
    super(color, board, pos)
    @value = :N
  end

end
