defmodule RockPaperScissors.PageController do
  use RockPaperScissors.Web, :controller

  def index(conn, _params) do
    player_uuid = case get_session(conn, :player_uuid) do
                  nil ->
                    uuid = UUID.uuid4
                    conn = put_session(conn, :player_uuid, uuid)
                    uuid
                  existent_uuid -> existent_uuid
                end
    render conn, "index.html", %{player_uuid: player_uuid}
  end
end
