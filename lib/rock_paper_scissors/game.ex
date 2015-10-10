defmodule RockPaperScissors.Game do
  use GenServer
  alias RockPaperScissors.Player

  defstruct uuid: nil,
            players: %{}

  def join(pid, player_id) do
    GenServer.cast(pid, {:join, player_id})
  end

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

  def handle_cast({:join, player_uuid}, state = %__MODULE__{players: players}) when map_size(players) < 2 do
    new_state = Map.update!(state, :players, fn(current) ->
      Map.put(current, player_uuid, %Player{uuid: player_uuid})
    end)
    {:noreply, new_state}
  end

  defp via_tuple(uuid) do
    {:via, RockPaperScissors.GameRegistry, {:game, uuid}}
  end
end
