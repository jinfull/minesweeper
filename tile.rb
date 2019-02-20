require_relative "board"

class Tile
    attr_reader 
    attr_accessor :adj_mine_count, :face_up, :is_bomb

    def initialize(is_bomb)
        @is_bomb = is_bomb
        @adj_mine_count = nil

        @face_up = false
    end

    def uncover
        @face_up = true
        nil
    end

    def value
        if @is_bomb
            return "B "
        elsif @adj_mine_count != nil
            return "#{adj_mine_count} "
        else
            return "  "
        end
    end
end