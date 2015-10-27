defmodule RockPaperScissors.GameScoreTest do
  use ExUnit.Case

  setup do
    {:ok, score_tracker} = RockPaperScissors.GameScore.start_link(TestScore)
    {:ok, score_tracker: score_tracker}
  end

  test "it starts at 0 for a given player", %{score_tracker: score_tracker} do
    assert RockPaperScissors.GameScore.get(score_tracker, "abc") == 0
    assert RockPaperScissors.GameScore.inc(score_tracker, "abc") == 1
  end

  test "it records the score and returns it", %{score_tracker: score_tracker} do
    assert RockPaperScissors.GameScore.inc(score_tracker, "abc") == 1
    assert RockPaperScissors.GameScore.inc(score_tracker, "abc") == 2
  end
end
