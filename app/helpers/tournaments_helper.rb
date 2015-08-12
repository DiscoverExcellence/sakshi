module TournamentsHelper
  def tournament_winner(t)
    if(t.winner)
      t.winner
    else
     p "to be played"
    end
  end
end
