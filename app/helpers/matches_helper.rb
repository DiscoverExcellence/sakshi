module MatchesHelper
  def match_date(m)
    if(m)
      return m
    else
      p "not available"
    end
  end

  def match_winner(match)
    if(match.winner)
      match.winner
    else
      p "to be played"
    end
  end
end
