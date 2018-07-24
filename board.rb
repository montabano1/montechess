require_relative 'piece.rb'
require_relative 'load_pieces.rb'

class Board


  attr_reader :grid, :piece, :black_pieces, :white_pieces
  attr_accessor :last_move, :last_move_piece

  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.new)}
    @grid[0][0] = Rook.new('black', self, [0,0])
    @grid[0][7] = Rook.new('black', self, [0,7])
    @grid[0][1] = Knight.new('black', self, [0,1])
    @grid[0][6] = Knight.new('black', self, [0,6])
    @grid[0][2] = Bishop.new('black', self, [0,2])
    @grid[0][5] = Bishop.new('black', self, [0,5])
    @grid[0][3] = Queen.new('black', self, [0,3])
    @grid[0][4] = King.new('black', self, [0,4])
    @black_king = @grid[0][4]
    @grid[7][0] = Rook.new('white', self, [7,0])
    @grid[7][7] = Rook.new('white', self, [7,7])
    @grid[7][1] = Knight.new('white', self, [7,1])
    @grid[7][6] = Knight.new('white', self, [7,6])
    @grid[7][2] = Bishop.new('white', self, [7,2])
    @grid[7][5] = Bishop.new('white', self, [7,5])
    @grid[7][3] = Queen.new('white', self, [7,3])
    @grid[7][4] = King.new('white', self, [7,4])
    @white_king = @grid[7][4]
    @grid[1].map!.with_index {|el, idx| el = Pawn.new('black', self, [1,idx])}
    @grid[6].map!.with_index {|el, idx| el = Pawn.new('white', self, [6,idx])}
    @black_pieces = @grid[0] + @grid[1]
    @white_pieces = @grid[6] + @grid[7]
    @last_move = []
    @last_move_piece = nil
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].class == NullPiece
      puts "There is no piece at #{start_pos}"
    elsif self[end_pos].color == self[start_pos].color
      puts "There is a piece at #{end_pos}"
    end
    piece = self[start_pos]
    if piece.possible_moves.include?(end_pos)
      @last_move_piece = self[end_pos]
      add_piece(self[start_pos], end_pos)
      self[start_pos] = NullPiece.new
      @last_move << [start_pos, end_pos]
      return 'yes'
    else
      puts "That is an invalid move"
    end
  end

  def undo_last_move
    @last_move_piece
    @last_move
    add_piece(self[@last_move.last[1]], @last_move.last[0])
    add_piece(@last_move_piece, @last_move.last[1])
    @last_move.pop
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,mark)
    row,col = pos
    @grid[row][col] = mark
  end

  def valid_pos?(pos)
    return false unless pos[0].between?(0,7) && pos[1].between?(0,7)
    true
  end

  def add_piece(piece,pos)
    self[pos] = piece
    piece.pos = pos
  end

  # def checkmate?(color)
  #   if self.in_check?(color)
  #     if color == 'white'
  #       @white_pieces.each do |piece|
  #         piece.possible_moves.each do |poss|
  #           if move_piece(piece.pos, poss) && self.in_check?(color) == false
  #             return false
  #           else undo_last_move
  #           end
  #         end
  #       end
  #     else
  #       @black_pieces.each do |piece|
  #         piece.possible_moves.each do |poss|
  #           if move_piece(piece.pos, poss) && self.in_check?(color) == false
  #             return false
  #           else undo_last_move
  #           end
  #         end
  #       end
  #     end
  #   end
  #   return true
  # end

  def in_check?(color)
    if color == 'white'
      @black_pieces.any? do |piece|
        piece.possible_moves.include?(@white_king.pos)
      end
    else
      @white_pieces.any? do |piece|
        piece.possible_moves.include?(@black_king.pos)
      end
    end
  end



  def find_king(color)

  end

end
