defmodule RockPaperScissors.GameScoreHandler do
  use GenEvent
  alias RockPaperScissors.GameScore

  def handle_event({:finish, game_state}, parent) do
    GameScore.inc(GameScore, game_state.winner)
    {:ok, parent}
  end
  def handle_event({_event, _game_state}, parent) do
    {:ok, parent}
  end
end
