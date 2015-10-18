defmodule RockPaperScissors.GameView do
  use RockPaperScissors.Web, :view
  alias RockPaperScissors.Game

  def render("index.json", %{games: games}) do
    games
    |> Map.values
    |> Enum.map(fn(pid) -> Game.state(pid) end)
    |> render_many(__MODULE__, "game.json")
  end

  def render("game.json", %{game: game}) do
    game |> Map.from_struct
  end
end
