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
    while true
      render
      until @cursor.selected
        @cursor.get_input
        system "clear"
        render
      end
      start_pos = @cursor.cursor_pos
      @cursor.toggle_selected
      until @cursor.selected
        @cursor.get_input
        system "clear"
        render
      end
      end_pos = @cursor.cursor_pos
      @cursor.toggle_selected
      board.move_piece(start_pos, end_pos)
    end
    #   if board.in_check?
    #     puts "CHECK"
    #   end
    #   puts "#{players.first} pick a starting row (0-7): "
    #   row = gets.chomp.to_i
    #   puts "#{players.first} pick a starting column (A-H)"
    #   col = alph_conversion.index(gets.chomp.upcase)
    #   puts "#{players.first} pick an ending row (0-7)"
    #   rowend = gets.chomp.to_i
    #   puts "#{players.first} pick an ending column (A-H)"
    #   colend = alph_conversion.index(gets.chomp.upcase)
      if board[start_pos].color == players.first
        if board.move_piece(start_pos, end_pos) == 'yes'
          players.rotate!
        end
      end
    #
    #   end
    #   render
    # end
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

b = Board.new
d = Display.new(b)
d.play
