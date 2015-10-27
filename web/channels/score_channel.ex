defmodule RockPaperScissors.ScoreChannel do
  use RockPaperScissors.Web, :channel
  alias RockPaperScissors.GameScore
  alias Phoenix.Socket, as: S

  def join("score:" <> player_uuid, _msg, socket = %S{assigns: %{player_uuid: player_uuid}}) do
    send(self, :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    push socket, "score", get_score(socket.assigns.player_uuid)
    {:noreply, socket}
  end

  def get_score(player_uuid) do
    %{score: GameScore.get(GameScore, player_uuid)}
  end
end
