defmodule RockPaperScissors.GameTest do
  use ExUnit.Case
  alias RockPaperScissors.Game

  setup do
    {:ok, game} = GenServer.start_link(Game, "abc")
    {:ok, game: game}
  end

  test "it assigns the uuid", %{game: game} do
    state = Game.state(game)
    assert state.uuid == "abc"
  end
end
