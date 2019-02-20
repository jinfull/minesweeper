require_relative "tile"
require "byebug"

class Board
    attr_accessor :board
    attr_reader :size, :mine_count, :mine_positions

    def initialize
        @size = 9
        @board = Array.new(@size) { Array.new (@size) }

        @mine_count = ((@size * @size) / 10.0).ceil

        self.populate_board
        self.random_mine_positions
        self.random_mine_placements
        self.update_all_adj_mine_counts
    end

    def populate_board
        (0...@size).each do |row_i|
            (0...@size).each do |col_i|
                @board[row_i][col_i] = Tile.new(false, row_i, col_i)
            end
        end
    end

    def random_mine_positions
        all_positions = []

        (0...@size).each do |row_i|
            (0...@size).each do |col_i|
                all_positions << [row_i, col_i]
            end
        end

        @mine_positions = all_positions.sample(@mine_count)
    end


    def random_mine_placements
        random_mine_positions.each do |position|
            self[*position].is_bomb = true
        end

        nil
    end
    
    def reveal_all
        (0...@size).each do |row_i|
            (0...@size).each do |col_i|
                @board[row_i][col_i].face_up = true
            end
        end

        nil
    end

    def count_adj_mines(tile) # need to account for 1) the given tile being a bomb itself, 2) positions less than 0 will backtrack to the end of the array and count bombs there, 3) Positions over the size of the array will return nil class
        # debugger
        counter = 0

        (tile.row-1..tile.row+1).each do |tile_row|
            if tile_row >= 0 && tile_row <= @size - 1
                (tile.col-1..tile.col+1).each do |col_row|
                    if col_row >= 0 && col_row <= @size - 1 
                        counter += 1 if @board[tile_row][col_row].is_bomb
                    end
                end
            end
        end

        counter -= 1 if tile.is_bomb # accounts for the tile itself being a bomb
        tile.adj_mine_count = counter
    end

    def update_all_adj_mine_counts
        (0...@size).each do |row_i|
            (0...@size).each do |col_i|
                count_adj_mines(@board[row_i][col_i])
            end
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

