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
    result = ''
    if @p1points == @p2points
      result = {
          0 => 'Love-All',
          1 => 'Fifteen-All',
          2 => 'Thirty-All',
      }.fetch(@p1points, 'Deuce')
    elsif @p1points >= 4 or @p2points >= 4
      minus_result = @p1points - @p2points
      if minus_result==1
        result ='Advantage ' + @player1_name
      elsif minus_result == -1
        result ='Advantage ' + @player2_name
      elsif minus_result >= 2
        result = 'Win for ' + @player1_name
      else
        result ='Win for ' + @player2_name
      end
    else
      (1...3).each do |i|
        if i == 1
          temp_score = @p1points
        else
          result+='-'
          temp_score = @p2points
        end
        result += {
            0 => 'Love',
            1 => 'Fifteen',
            2 => 'Thirty',
            3 => 'Forty',
        }[temp_score]
      end
    end
    result
  end

end

class TennisGame2

  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1points = 0
    @p2points = 0
  end

  def won_point(player_name)
    if player_name == @player1_name
      p1_score
    else
      p2_score
    end
  end

  def score
    result = ''
    if @p1points == @p2points and @p1points < 3
      if @p1points == 0
        result = 'Love'
      end
      if @p1points == 1
        result = 'Fifteen'
      end
      if @p1points == 2
        result = 'Thirty'
      end
      result += '-All'
    end

    if @p1points == @p2points and @p1points > 2
      result = 'Deuce'
    end

    p1res = ''
    p2res = ''
    if @p1points > 0 and @p2points == 0
      if @p1points == 1
        p1res = 'Fifteen'
      end
      if @p1points == 2
        p1res = 'Thirty'
      end
      if @p1points == 3
        p1res = 'Forty'
      end
      p2res = 'Love'
      result = p1res + '-' + p2res
    end

    if @p2points > 0 and @p1points == 0
      if @p2points == 1
        p2res = 'Fifteen'
      end
      if @p2points == 2
        p2res = 'Thirty'
      end
      if @p2points == 3
        p2res = 'Forty'
      end

      p1res = 'Love'
      result = p1res + '-' + p2res
    end

    if @p1points > @p2points and @p1points < 4
      if @p1points == 2
        p1res='Thirty'
      end
      if @p1points == 3
        p1res='Forty'
      end
      if @p2points == 1
        p2res='Fifteen'
      end
      if @p2points == 2
        p2res='Thirty'
      end
      result = p1res + '-' + p2res
    end

    if @p2points > @p1points and @p2points < 4
      if @p2points == 2
        p2res='Thirty'
      end
      if @p2points == 3
        p2res='Forty'
      end
      if @p1points == 1
        p1res='Fifteen'
      end
      if @p1points == 2
        p1res='Thirty'
      end
      result = p1res + '-' + p2res
    end

    if @p1points > @p2points and @p2points >= 3
      result = 'Advantage ' + @player1_name
    end

    if @p2points > @p1points and @p1points >= 3
      result = 'Advantage ' + @player2_name
    end

    if @p1points >= 4 and @p2points >= 0 and (@p1points - @p2points) >= 2
      result = 'Win for ' + @player1_name
    end

    if @p2points >= 4 and @p1points >= 0 and (@p2points - @p1points) >= 2
      result = 'Win for ' + @player2_name
    end

    result
  end

  def setp1_score(number)
    (0..number).each do
      p1_score
    end
  end

  def setp2_score(number)
    (0..number).each do
      p2_score
    end
  end

  def p1_score
    @p1points += 1
  end

  def p2_score
    @p2points += 1
  end
end

class TennisGame3

  def initialize(player1_name, player2_name)
    @p1_n = player1_name
    @p2_n = player2_name
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    if n == @p1_n
      @p1 += 1
    else
      @p2 += 1
    end
  end

  def score
    if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
      p = %w(Love Fifteen Thirty Forty)
      s = p[@p1]
      @p1 == @p2 ? s + '-All' : s + '-' + p[@p2]
    else
      if @p1 == @p2
        'Deuce'
      else
        s = @p1 > @p2 ? @p1_n : @p2_n
        (@p1-@p2) * (@p1-@p2) == 1 ? 'Advantage ' + s : 'Win for ' + s
      end
    end
  end

end
