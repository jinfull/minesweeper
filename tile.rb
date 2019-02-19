require_relative "board"

class Tile
    attr_reader :is_bomb
    attr_accessor :adj_mine_count, :face_up

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