defmodule RockPaperScissors.GameViewTest do
  use ExUnit.Case
  alias RockPaperScissors.Game
  alias RockPaperScissors.Player
  alias RockPaperScissors.GameView

  test "it renders a game" do
    game = %Game{uuid: "game123",
                 players: %{"abc" => %Player{uuid: "abc", move: :rock},
                            "def" => %Player{uuid: "def", move: :paper}},
                 winner: "def"}

    assert GameView.render("game.json", %{game: game}) == %{
      uuid: "game123",
      winner: "def",
      players: %{
        "abc" => %{uuid: "abc", moved: true},
        "def" => %{uuid: "def", moved: true}
      }
    }
  end
end
