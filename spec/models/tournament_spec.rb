require 'rails_helper'

RSpec.describe Tournament, type: :model do
   
  it "should return winner" do
    Player.create(name: "radhika")
    p1 = Player.find_by(name: "radhika").id
    Player.create(name: "madhura")
    p2 = Player.find_by(name: "madhura").id
    Game.create(name: "BasketBall", scoring_pts: 200)
    Tournament.create!(name: "Sep 15", game_id: Game.find_by(name: "BasketBall").id)
    tnmt = Tournament.find_by(name: "Sep 15").id
    Match.create!(venue: "chicago", game_id: Game.find_by(name: "BasketBall").id)
    match = Match.find_by(venue: "chicago").id
    Score.create(player_id: p1, match_id: match, points: 200, tournament_id: tnmt)
    Score.create(player_id: p2, match_id: match, points: 0, tournament_id: tnmt)
    t = Tournament.find_by(name: "Sep 15")
    expect(t.winner).to eq("radhika")
  
 # pending "add some examples to (or delete) #{__FILE__}"
  end

  it "should return top three" do 
    Player.create(name: "radhika")
    p1 = Player.find_by(name: "radhika").id
    Player.create(name: "madhura")
    p2 = Player.find_by(name: "madhura").id
    Player.create(name: "teena")
    p3 = Player.find_by(name: "teena").id
    Player.create(name: "anjali")
    p4 = Player.find_by(name: "anjali").id
    Game.create(name: "BasketBall", scoring_pts: 200)
    Tournament.create!(name: "Sep 15", game_id: Game.find_by(name: "BasketBall").id)
    tnmt = Tournament.find_by(name: "Sep 15").id
    Match.create!(venue: "chicago", game_id: Game.find_by(name: "BasketBall").id)
    match = Match.find_by(venue: "chicago").id
    Score.create(player_id: p1, match_id: match, points: 200, tournament_id: tnmt)
    Score.create(player_id: p2, match_id: match, points: 150, tournament_id: tnmt)
    Score.create(player_id: p3, match_id: match, points: 100, tournament_id: tnmt)
    Score.create(player_id: p4, match_id: match, points: 50, tournament_id: tnmt)
    t = Tournament.find_by(name: "Sep 15")
    expect(t.top_three).to eq(["radhika","madhura","teena"]) 
  end

end
