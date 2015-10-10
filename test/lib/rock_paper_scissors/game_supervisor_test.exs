defmodule RockPaperScissors.GameSupervisorTest do
  use ExUnit.Case
  alias RockPaperScissors.GameSupervisor
  alias RockPaperScissors.Game

  setup do
    {:ok, pid} = GameSupervisor.start_new_game
    {:ok, pid: pid}
  end

  test "starts a new game", %{pid: pid} do
    assert is_pid(pid)
  end

  test "it uses a uuid v4", %{pid: pid} do
    %Game{uuid: uuid} = Game.state(pid)
    assert 4 == UUID.info!(uuid) |> Dict.get(:version)
  end
end
