class Tournament < ActiveRecord::Base
  validates :game_id, presence: true
  has_many :matches, dependent: :destroy
  belongs_to :game
  belongs_to :user
  has_many :scores, dependent: :destroy
  accepts_nested_attributes_for :matches


=begin
  Match.where(tournament_id: 24).each do |match|
     Score.where(match_id: "#{match.id}").update_all(tournament_id: 24)
  end
=end

  def winner
    tnmt_id = self.id
    winner_id = Score.group(:player_id).having(:tournament_id == tnmt_id).sum(:points).max_by{|k,v| v}.first
    p Player.find(winner_id).name
  end

  def top_three
    tnmt_id = self.id
    winner = []
    winner_list = Score.group(:player_id).having(:tournament_id == tnmt_id).sum(:points).max_by(3){|k,v| v}.flatten
    winner_list.each_with_index do |winner_id,index|
      if(index.even?)
        winner << (Player.find(winner_list[index]).name)
      end
    end
    p winner
  end

end
