class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
    validates :yomigana, presence: true, length: { maximum: 50 }, uniqueness: true
    

    def entry_room
      self.in_room = true
    end

    def exit_room
        self.in_room = false
    end
    private
      def in_room?

      end
end
