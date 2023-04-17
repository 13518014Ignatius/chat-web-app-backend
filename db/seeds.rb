# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

RoomMessage.delete_all
Room.delete_all
User.delete_all
Room.create([{name: "Room 1"}, {name: "Room 2"}, {name: "Room 3"}])
User.create([{username: "User 1"}, {username: "User 2"}, {username: "User 3"}])
RoomMessage.create([{room_id: Room.find_by(name: "Room 1").id, user_id: User.find_by(username: "User 1").id, message: "Hello! Welcome to Room 1!"},
                  {room_id: Room.find_by(name: "Room 2").id, user_id: User.find_by(username: "User 2").id, message: "This is a room of freedom, Room 2!"},
                  {room_id: Room.find_by(name: "Room 3").id, user_id: User.find_by(username: "User 3").id, message: "Here are the rules of Room 3: There are no rules!"},
                  {room_id: Room.find_by(name: "Room 1").id, user_id: User.find_by(username: "User 3").id, message: "Yippee!"},
                  {room_id: Room.find_by(name: "Room 2").id, user_id: User.find_by(username: "User 1").id, message: "Yahoo!"},
                  {room_id: Room.find_by(name: "Room 3").id, user_id: User.find_by(username: "User 2").id, message: "Let's go!"}])
p "Created #{Room.count} chat rooms"
p "Created #{User.count} users"
p "Created #{RoomMessage.count} messages"