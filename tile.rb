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
end