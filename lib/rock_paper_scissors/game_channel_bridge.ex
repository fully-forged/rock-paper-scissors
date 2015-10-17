defmodule RockPaperScissors.GameChannelBridge do
  use GenEvent
  import RockPaperScissors.Endpoint, only: [broadcast: 3]

  def handle_event({event, game_state}, parent) do
    broadcast "games", Atom.to_string(event), game_state
    {:ok, parent}
  end
end
