defmodule Interesting do
  def correct_pass(player_guess, secret_letters) do
    secret_letters_charlist = String.to_charlist(secret_letters)

    {resule, remainders} =
      player_guess
      |> String.to_charlist()
      |> Enum.zip(initial_state(secret_letters_charlist))
      |> Enum.reduce({[], secret_letter_charlist}, fn {guess_letter, {_status, secret_letter}},
                                                      {result, remaining_letters} ->
        compare_letter(guess_letter, secret_letter, result, remaining_letters)
      end)

    {Enum.reverse(result), remainders}
  end

  def compare_letter(letter, letter, result, remaining_letters) do
    {[{:correct, to_string([letter])} | result], remaining_letters -- [letter]}
  end

  def compare_letter(guess_letter, _letter, result, remaining_letters) do
    {[{:incorrect, to_string([guess_letter])} | result], remaining_letters}
  end
end
