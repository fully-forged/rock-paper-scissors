defmodule RockPaperScissors.GameLogger do
  use GenEvent
  require Logger

  def handle_event({event, game_state}, parent) do
    Logger.info "source=games type=#{event} uuid=#{game_state.uuid}"
    {:ok, parent}
  end
end
