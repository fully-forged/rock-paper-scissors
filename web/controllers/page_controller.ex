defmodule RockPaperScissors.PageController do
  use RockPaperScissors.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
