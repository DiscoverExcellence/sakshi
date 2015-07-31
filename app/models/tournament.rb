class Tournament < ActiveRecord::Base
  validates :game_id, presence: true
  has_many :matches, dependent: :destroy
  belongs_to :game
  has_many :scores, dependent: :destroy

=begin
  Match.where(tournament_id: 24).each do |match|
     Score.where(match_id: "#{match.id}").update_all(tournament_id: 24)
  end
=end

  def winner
    winner_id = Score.group(:player_id).having(:tournament_id == 24).sum(:points).max_by{|k,v| v}.first
    p Player.find(winner_id).name
  end

  def top_three
    winner_list = Score.group(:player_id).having(:tournament_id == 24).sum(:points).max_by(3){|k,v| v}.flatten
    winner_list.each_with_index do |winner_id,index|
     p Player.find(winner_list[index]).name if(index.even?)
    end
  end

end
