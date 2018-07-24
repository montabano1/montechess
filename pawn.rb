require_relative 'piece.rb'
require_relative 'pawn_moves.rb'
require 'byebug'

class Pawn < Piece
  include PawnMoves
  def initialize(color, board, pos)
    super(color, board, pos)
    @value = :P
  end

end
