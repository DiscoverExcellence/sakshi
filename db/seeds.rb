# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
##   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin
games = ["fifa", "tennis", "boxing"]
matches = ["leeds", "newyork", "paris"]
tournaments = ["EPL", "MLS", "french open"]
games.each_with_index do |game,index|
  game_object = Game.find_or_create_by!(name: game , scoring_pts: 100 , description: "a game of multiple players")
  game_object.matches.create(venue: "#{matches[index]}", game_id: "#{game_object.id}")
  game_object.tournaments.create(name: "#{tournaments[index]}", game_id: "#{game_object.id}")
end

players = ["mohit", "devendra", "ashwini", "sakshi"]
players.each do |player|
  Player.find_or_create_by(name: player , info: "experince 10 yrs" )
end
=end

=begin
game_object = Game.find_by(name: "basketball")
game_object.tournaments.find_or_create_by(name: "Sep 15")
tournament_object = Tournament.find_by(name: "Sep 15")
matches = ["chicago", "LA", "sanfrancisco" , "washington", "california", "miami", "mexico" , "florida", "australia", "germany"]
matches.each do |match|
  tournament_object.matches.create(venue: "#{match}", game_id: "#{game_object.id}")
end
=end

=begin
matches = ["chicago", "LA", "sanfrancisco" , "washington", "california", "miami", "mexico" , "florida", "australia", "germany"]
game_object = Game.find_by(name: "basketball")
id_no = 1
matches.each do |venue|
  match = Match.find_by(venue: "#{venue}")
  match.scores.create(player_id: id_no, points: "#{game_object.scoring_pts}")
  id_no += 1
  match.scores.create(player_id: id_no, points: 0)
  id_no = 1 if(id_no == 4)
end
=end

#User.create(email: "sakshi@joshsoftware.com" , password: "josh123", password_confirmation: "josh123") 

