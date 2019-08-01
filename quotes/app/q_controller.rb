class QController < Roolz::Controller
  def a_quote
    "Here's a new quote"
  end

  def shakes
    @noun = :winking
    render(:shakes)
  end

  def card_trick
    n = params["card"] || "Queen"
    "Your card: the #{n} of Spades!"
  end
end
