defmodule RockPaperScissors.GameChannel do
  use RockPaperScissors.Web, :channel
  alias RockPaperScissors.GameRegistry
  alias RockPaperScissors.GameSupervisor
  alias RockPaperScissors.Game

  alias RockPaperScissors.GameView, as: Serializer

  def join("games", _msg, socket) do
    send(self, :after_join)
    {:ok, socket}
  end

  def handle_in("start", %{}, socket) do
    GameSupervisor.start_new_game
    {:noreply, socket}
  end

  def handle_in("join", %{"game_uuid" => game_uuid}, socket) do
    GameRegistry.whereis_name({:game, game_uuid})
    |> Game.join(socket.assigns.player_uuid)
    {:noreply, socket}
  end

  def handle_in("move", %{"game_uuid" => game_uuid, "move" => move}, socket) do
    GameRegistry.whereis_name({:game, game_uuid})
    |> Game.move(socket.assigns.player_uuid, String.to_existing_atom(move))
    {:noreply, socket}
  end

  def handle_info(:after_join, socket) do
    push socket, "get-all", %{games: get_games}
    {:noreply, socket}
  end

  defp get_games do
    Serializer.render("index.json", %{games: GameRegistry.get_all})
  end
end
