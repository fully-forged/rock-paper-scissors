defmodule RockPaperScissors.GameScoreHandler do
  use GenEvent
  alias RockPaperScissors.GameScore
  import RockPaperScissors.Endpoint, only: [broadcast: 3]

  def handle_event({:finish, game_state}, parent) do
    new_score = GameScore.inc(GameScore, game_state.winner)
    broadcast_score(game_state.winner, new_score)
    {:ok, parent}
  end
  def handle_event({_event, _game_state}, parent) do
    {:ok, parent}
  end

  defp broadcast_score(:draw, _new_score), do: :ok
  defp broadcast_score(winner, new_score) do
    broadcast "score:" <> winner, "score", %{score: new_score}
  end
end
