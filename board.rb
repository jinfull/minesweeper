require_relative "tile"

class Board
    attr_accessor :board
    attr_reader :size

    def initialize
        @size = 9
        @board = Array.new(@size) { Array.new (@size) }


        self.populate_board
    end

    def populate_board
        (0...@size).each do |row_i|
            (0...@size).each do |col_i|
                @board[row_i][col_i] = Tile.new(false)
            end
        end
    end

    def render
        (0...@size).each do |row_i|
            (0...@size).each do |col_i|
                if @board[row_i][col_i].face_up && @board[row_i][col_i].is_bomb
                    print "B "
                elsif @board[row_i][col_i].face_up && !@board[row_i][col_i].is_bomb
                    print "# "
                else
                    print "? "
                end
            end
            puts "\n"
        end

        nil
    end


end

