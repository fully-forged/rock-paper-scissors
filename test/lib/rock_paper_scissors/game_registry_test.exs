defmodule RockPaperScissors.GameRegistryTest do
  use ExUnit.Case
  alias RockPaperScissors.GameSupervisor
  alias RockPaperScissors.GameRegistry
  alias RockPaperScissors.Game

  setup do
    {:ok, game} = GameSupervisor.start_new_game
    {:ok, game: game}
  end

  test "when started, a game is added to the registry", %{game: game} do
    %Game{uuid: uuid} = Game.state(game)
    assert GameRegistry.get_all |> Map.get({:game, uuid}) == game
  end

  test "when a game ends/crashes, it's removed from the registry", %{game: game} do
    %Game{uuid: uuid} = Game.state(game)
    Process.exit(game, :crash)
    :timer.sleep 10
    assert GameRegistry.get_all |> Map.get({:game, uuid}) == nil
  end
end
