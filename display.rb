require_relative 'board.rb'
require_relative 'piece.rb'
require 'colorize'
require_relative 'cursor.rb'
require 'byebug'

class Display

  attr_accessor :board
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def play
    players = ['white','black']
    alph_conversion = ('A'..'H').to_a
    system "clear"
    render
    while true
      until @cursor.selected && @board[@cursor.cursor_pos].color == players[0]
        if @board.in_check?(players[0])
          # if @board.checkmate?(players[0])
          #   puts 'CHECKMATE'
          # else
            puts 'CHECK'
          # end
        end
        puts players[0] + "'s turn"
        @cursor.selected = false
        @cursor.get_input
        system "clear"
        render
      end
      start_pos = @cursor.cursor_pos
      system "clear"
      render
      piece = @board[start_pos].class.to_s
      @cursor.toggle_selected
      until @cursor.selected
        puts 'Where would you like to move the ' + piece + ' at ' + start_pos.to_s
        @cursor.get_input
        system "clear"
        render
      end
      end_pos = @cursor.cursor_pos
      @cursor.toggle_selected
      if board.move_piece(start_pos, end_pos) == 'yes'
        players.rotate!
      end
    end
  end

  def render
    puts ''
    puts "    A   B   C   D   E   F   G   H"
    board.grid.each_with_index do |row, ridx|
      puts "   ---------------------------------"
      print "#{ridx} "
      row.each_with_index do |piece, col|
        if [ridx,col] == @cursor.cursor_pos
          print '| '
          unless piece.class == NullPiece
            print piece.value.to_s.colorize(:white)
          else
            print 'X'.colorize(:white)
          end
          print ' '
        else
          print '| '
          if piece.color == 'white'
            print piece.value.to_s.colorize(:red)
          else
            print piece.value.to_s.colorize(:blue)
          end
          print ' '
          # print piece.value
        end
      end
      print '|'
      print "\n"
    end
    print "   ---------------------------------"
    print "\n"
    'board'
  end

end
#
b = Board.new
d = Display.new(b)
d.play
