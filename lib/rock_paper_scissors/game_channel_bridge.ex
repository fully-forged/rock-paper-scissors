defmodule RockPaperScissors.GameChannelBridge do
  use GenEvent
  import RockPaperScissors.Endpoint, only: [broadcast: 3]
  alias RockPaperScissors.GameView, as: Serializer

  def handle_event({event, game_state}, parent) do
    broadcast "games", Atom.to_string(event), serialize(game_state)
    {:ok, parent}
  end

  defp serialize(game) do
    Serializer.render("game.json", %{game: game})
  end
end
