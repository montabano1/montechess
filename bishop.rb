require_relative 'sliding_piece.rb'
require_relative 'piece.rb'

class Bishop < Piece
  include SlidingPiece
  def initialize(color, board, pos)
    super(color, board, pos)
    @value = :B
    @type = [:diag]
  end

end
