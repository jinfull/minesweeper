require_relative "tile"
require "byebug"

class Board
    attr_accessor :board
    attr_reader :size, :mine_count

    def initialize
        @size = 9
        @board = Array.new(@size) { Array.new (@size) }

        @mine_count = ((@size * @size) / 10.0).ceil

        self.populate_board
        self.random_mine_positions
        self.random_mine_placements
    end

    def populate_board
        (0...@size).each do |row_i|
            (0...@size).each do |col_i|
                @board[row_i][col_i] = Tile.new(false)
            end
        end
    end

    def random_mine_positions
        my_arr = []

        (0...@size).each do |row_i|
            (0...@size).each do |col_i|
                my_arr << [row_i, col_i]
            end
        end

        my_arr.sample(@mine_count)
    end


    def random_mine_placements
        random_mine_positions.each do |position|
            self[*position].is_bomb = true
        end

        nil
    end
    

    def render
        (0...@size).each do |row_i|
            (0...@size).each do |col_i|
                if @board[row_i][col_i].face_up
                    print "#{@board[row_i][col_i].value}"
                else
                    print "? "
                end
            end

            puts "\n"
        end

        nil
    end

    def [](row, col)
        @board[row][col]
    end

    def []=(row, col, value)
        @board[row][col] = value
    end
end

