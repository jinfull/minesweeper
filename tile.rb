require_relative "board"
require "colorize"

class Tile
    attr_reader :row, :col
    attr_accessor :adj_mine_count, :face_up, :is_bomb

    def initialize(is_bomb, row, col)
        @is_bomb = is_bomb
        @row = row
        @col = col

        @adj_mine_count = 0

        @face_up = false
    end

    def uncover
        @face_up = true
        nil
    end

    # def count_adj_mines


    # end

    def value
        if @is_bomb
            return "X ".colorize(:red)
        else
            if adj_mine_count == 0
                return "#{adj_mine_count} "
            else
                return "#{@adj_mine_count} ".colorize(:yellow)
            end
        end
    end
end