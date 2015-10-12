defmodule RockPaperScissors.GameRulesTest do
  use ExUnit.Case
  alias RockPaperScissors.GameRules
  alias RockPaperScissors.Game
  alias RockPaperScissors.Player

  test "no players -> no winner" do
    game = %Game{players: %{}}
    assert GameRules.winner_for(game) == nil
  end

  test "one player -> no winner" do
    game = %Game{players: %{"abc" => %Player{uuid: "abc", move: nil}}}
    assert GameRules.winner_for(game) == nil
  end

  test "one move -> no winner" do
    game = %Game{players: %{"abc" => %Player{uuid: "abc", move: :rock},
                            "def" => %Player{uuid: "def", move: nil}}}
    assert GameRules.winner_for(game) == nil
  end

  test "follows correct rules" do
    game = %Game{players: %{"abc" => %Player{uuid: "abc", move: :rock},
                            "def" => %Player{uuid: "def", move: :paper}}}
    assert GameRules.winner_for(game) == "def"
  end
end
