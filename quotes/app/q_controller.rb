class QController < Roolz::Controller
  def a_quote
    "Here's a new quote"
  end

  def shakes
    @noun = :winking
    render(:shakes)
  end
end
