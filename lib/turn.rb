class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war
  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :mutually_assured_destruction
    else
      return :basic
    end
  end

  def winner
    if turn.type == :basic
      if player1.deck.rank_of_card(0) > player2.deck.rank_of_card(0)
        return player1
      else
        return player2
      end
    elsif turn.type == :war
      if player1.deck.rank_of_card(2) > player2.deck.rank_of_card(2)
        return player1
      else
        return player2
      end
    elsif turn.type == :mutually_assured_destruction
      return "No Winner"
    end

  end

end
