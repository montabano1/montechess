require_relative 'sliding_piece.rb'
require_relative 'piece.rb'

class Queen < Piece
  attr_reader :type

  include SlidingPiece
  def initialize(color, board, pos)
    super(color, board, pos)
    @value = :Q
    @type = [:straight, :diag]
  end

end
