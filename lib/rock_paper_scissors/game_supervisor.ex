defmodule RockPaperScissors.GameSupervisor do
  import Supervisor.Spec
  alias RockPaperScissors.Game

  def start_new_game do
    uuid = UUID.uuid4
    Supervisor.start_child(__MODULE__, [uuid])
  end

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      worker(Game, [], restart: :temporary)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
