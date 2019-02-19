require_relative "board"

class Tile
    attr_reader :is_bomb
    attr_accessor :adj_mine_count, :face_up

    def initialize(is_bomb, adj_mine_count = nil)
        @is_bomb = is_bomb
        @adj_mine_count = adj_mine_count

        @face_up = false
    end
end