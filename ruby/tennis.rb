class TennisGame1

  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1points = 0
    @p2points = 0
  end


  def won_point(player_name)
    if player_name == @player1_name
      @p1points += 1
    else
      @p2points += 1
    end
  end


  def score
    if tie?

      handle_tie

    elsif in_endgame?

      handle_endgame

    else

      handle_midgame

    end
  end


  protected


  def in_endgame?
    @p1points>=4 or @p2points>=4
  end


  def tie?
    @p1points == @p2points
  end


  def handle_tie
    if @p1points < 3
      "#{score_name(@p1points)}-All"
    else
      "Deuce"
    end
  end


  def handle_midgame
    "#{score_name(@p1points)}-#{score_name(@p2points)}"
  end


  def handle_endgame
    "#{advantage_text} #{player_in_lead}"
  end


  def advantage_text
    have_winner? ? 'Win for' : 'Advantage'
  end


  def player_in_lead
    @p1points > @p2points ? @player1_name : @player2_name
  end


  def score_name(score)
    {
        0 => "Love",
        1 => "Fifteen",
        2 => "Thirty",
        3 => "Forty",
    }[score]
  end


  def have_winner?
    [@p1points, @p2points].max > 3 && (@p1points - @p2points).abs > 1
  end

end

class TennisGame2
  def initialize(player1Name, player2Name)
    @player1_name = player1Name
    @player2_name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    if playerName == @player1_name
      p1Score()
    else
      p2Score()
    end
  end

  def score
    result = ""
    if (@p1points == @p2points and @p1points < 3)
      if (@p1points==0)
        result = "Love"
      end
      if (@p1points==1)
        result = "Fifteen"
      end
      if (@p1points==2)
        result = "Thirty"
      end
      result += "-All"
    end
    if (@p1points==@p2points and @p1points>2)
      result = "Deuce"
    end

    p1res = ""
    p2res = ""
    if (@p1points > 0 and @p2points==0)
      if (@p1points==1)
        p1res = "Fifteen"
      end
      if (@p1points==2)
        p1res = "Thirty"
      end
      if (@p1points==3)
        p1res = "Forty"
      end
      p2res = "Love"
      result = p1res + "-" + p2res
    end
    if (@p2points > 0 and @p1points==0)
      if (@p2points==1)
        p2res = "Fifteen"
      end
      if (@p2points==2)
        p2res = "Thirty"
      end
      if (@p2points==3)
        p2res = "Forty"
      end

      p1res = "Love"
      result = p1res + "-" + p2res
    end

    if (@p1points>@p2points and @p1points < 4)
      if (@p1points==2)
        p1res="Thirty"
      end
      if (@p1points==3)
        p1res="Forty"
      end
      if (@p2points==1)
        p2res="Fifteen"
      end
      if (@p2points==2)
        p2res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p2points>@p1points and @p2points < 4)
      if (@p2points==2)
        p2res="Thirty"
      end
      if (@p2points==3)
        p2res="Forty"
      end
      if (@p1points==1)
        p1res="Fifteen"
      end
      if (@p1points==2)
        p1res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p1points > @p2points and @p2points >= 3)
      result = "Advantage " + @player1_name
    end
    if (@p2points > @p1points and @p1points >= 3)
      result = "Advantage " + @player2_name
    end
    if (@p1points>=4 and @p2points>=0 and (@p1points-@p2points)>=2)
      result = "Win for " + @player1_name
    end
    if (@p2points>=4 and @p1points>=0 and (@p2points-@p1points)>=2)
      result = "Win for " + @player2_name
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |i|
      p1Score()
    end
  end

  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end

  def p1Score
    @p1points +=1
  end

  def p2Score
    @p2points +=1
  end
end

class TennisGame3
  def initialize(player1Name, player2Name)
    @p1_name = player1Name
    @p2_name = player2Name
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    if n == @p1_name
      @p1 += 1
    else
      @p2 += 1
    end
  end

  def score
    if in_middlegame?
      s = point_to_score(@p1)
      equal_scores? ? s + "-All" : s + "-" + point_to_score(@p2)
    elsif equal_scores?
      "Deuce"
    else
      more_than_one_point_lead? ? "Win for " + player_in_lead : "Advantage " + player_in_lead
    end
  end

  def point_to_score(point)
    %w(Love Fifteen Thirty Forty)[point]
  end

  def more_than_one_point_lead?
    (@p1-@p2)*(@p1-@p2) > 1
  end

  def player_in_lead
    @p1 > @p2 ? @p1_name : @p2_name
  end

  def equal_scores?
    @p1 == @p2
  end

  def in_middlegame?
    @p1 < 4 and @p2 < 4 and @p1 + @p2 < 6
  end
end
