class PagesController < ApplicationController
    def index
        @user = User.all
        @users_in_room = []
        @user_ent = User.new
        @user_array = []

        @user.each do |u|
            row = [u.name, u.name]
            @user_array.push(row)
            @users_in_room.append(u) if u.in_room == true
        end
        @users_in_room.sort!{|a, b| a.entry_time.to_i <=> b.entry_time.to_i}
    end

    def readme
        
    end
end
