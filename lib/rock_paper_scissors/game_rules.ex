defmodule RockPaperScissors.GameRules do
  def winner_for(game) do
    game.players
    |> Enum.map(fn({uuid, player}) ->
      {uuid, player.move}
    end)
    |> do_winner_for
  end

  defp do_winner_for([]), do: nil
  defp do_winner_for([{_p, _move}]), do: nil
  defp do_winner_for([{_p1, :rock},     {p2, :paper}]), do: p2
  defp do_winner_for([{_p1, :paper},    {p2, :scissors}]), do: p2
  defp do_winner_for([{_p1, :scissors}, {p2, :rock}]), do: p2
  defp do_winner_for([{p1, :paper},     {_p2, :rock}]), do: p1
  defp do_winner_for([{p1, :scissors},  {_p2, :paper}]), do: p1
  defp do_winner_for([{p1, :rock},      {_p2, :scissors}]), do: p1
  defp do_winner_for([{_p1, :rock},      {_p2, :rock}]), do: :draw
  defp do_winner_for([{_p1, :paper},     {_p2, :paper}]), do: :draw
  defp do_winner_for([{_p1, :scissors},  {_p2, :scissors}]), do: :draw
  defp do_winner_for([_any,             {_p2, nil}]), do: nil
  defp do_winner_for([{_p1, nil},       _any]), do: nil
end
