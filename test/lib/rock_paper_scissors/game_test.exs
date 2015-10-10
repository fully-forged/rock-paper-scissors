defmodule RockPaperScissors.GameTest do
  use ExUnit.Case
  alias RockPaperScissors.Game
  alias RockPaperScissors.Player

  setup do
    {:ok, game} = GenServer.start_link(Game, "abc")
    {:ok, game: game}
  end

  test "it assigns the uuid", %{game: game} do
    state = Game.state(game)
    assert state.uuid == "abc"
  end

  test "it starts with no players", %{game: game} do
    state = Game.state(game)
    assert state.players == %{}
  end

  test "it can be joined by two players", %{game: game} do
    Game.join(game, "player-1")
    Game.join(game, "player-2")
    state = Game.state(game)
    assert state.players == %{
      "player-1" => %Player{uuid: "player-1"},
      "player-2" => %Player{uuid: "player-2"}
    }
  end
end
