require_relative 'pieces/piece.rb'
require_relative 'load_pieces.rb'

class Board


  attr_reader :grid, :piece, :pieces_array

  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.new)}
    @grid[0][0] = Rook.new('black', self, [0,0])
    @grid[0][7] = Rook.new('black', self, [0,7])
    @grid[0][1] = Knight.new('black', self, [0,1])
    @grid[0][6] = Knight.new('black', self, [0,6])
    @grid[0][2] = Bishop.new('black', self, [0,2])
    @grid[0][5] = Bishop.new('black', self, [0,5])
    @grid[0][3] = Queen.new('black', self, [0,3])
    @black_king = King.new('black', self, [0,4])
    @grid[0][4] = @black_king
    @grid[7][0] = Rook.new('white', self, [7,0])
    @grid[7][7] = Rook.new('white', self, [7,7])
    @grid[7][1] = Knight.new('white', self, [7,1])
    @grid[7][6] = Knight.new('white', self, [7,6])
    @grid[7][2] = Bishop.new('white', self, [7,2])
    @grid[7][5] = Bishop.new('white', self, [7,5])
    @grid[7][3] = Queen.new('white', self, [7,3])
    @white_king = King.new('white', self, [7,4])
    @grid[7][4] = @white_king
    @grid[1].map!.with_index {|el, idx| el = Pawn.new('black', self, [1,idx])}
    @grid[6].map!.with_index {|el, idx| el = Pawn.new('white', self, [6,idx])}
    @pieces_array = @grid[0] + @grid[1] + @grid[6] + @grid[7]
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].class == NullPiece
      raise MoveError.new("There is no piece at #{start_pos}")
    end
    unless self[end_pos].class == NullPiece
      raise MoveError.new("There is a piece at #{end_pos}")
    end
    piece = self[start_pos]
    if piece.possible_moves.include?(end_pos)
      add_piece(self[start_pos], end_pos)
      self[start_pos] = NullPiece.new
    else
      puts "That is an invalid move"
    end
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

  def checkmate?(color)

  end

  def in_check?
    @pieces_array.any? do |piece|
      (piece.possible_moves.include?(@black_king.pos) ||
      piece.possible_moves.include?(@white_king.pos))
    end
  end

  def test
    ans = []
    @pieces_array.each {|el| ans << el.value}
    ans
  end

  def find_king(color)

  end

end
