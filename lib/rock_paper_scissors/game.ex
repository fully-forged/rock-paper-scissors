defmodule RockPaperScissors.Game do
  use GenServer

  defstruct uuid: nil

  def start_link(uuid) do
    GenServer.start_link(__MODULE__, uuid, name: via_tuple(uuid))
  end

  def state(pid) do
    GenServer.call(pid, :state)
  end

  def init(uuid) do
    {:ok, %__MODULE__{uuid: uuid}}
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  defp via_tuple(uuid) do
    {:via, RockPaperScissors.GameRegistry, {:game, uuid}}
  end
end
