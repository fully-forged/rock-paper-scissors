defmodule RockPaperScissors.GameScore do
  def start_link(name) do
    Agent.start_link(fn() -> %{} end, name: name)
  end

  def get(pid, player_uuid) do
    Agent.get(pid, fn(current) ->
      Map.get(current, player_uuid, 0)
    end)
  end

  def inc(pid, player_uuid) do
    Agent.get_and_update(pid, fn(current) ->
      score = Map.get(current, player_uuid, 0)
      {score + 1, Map.put(current, player_uuid, score + 1)}
    end)
  end
end
