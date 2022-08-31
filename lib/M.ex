defmodule M do

  def main do
    inout()
    int_stuff()
    float_stuff()
    atom_stuff()
    range_stuff()
    str_stuff()
    math_stuff()
    compare_stuff()
    condition_stuff()
  end

  #############################################################
  ## INPUT-OUTPUT
  #############################################################
  def inout do
      # |> pipes the raw IO.gets --> String.trim, removing /n
      # Result: var name scoped to do..end

    name = IO.gets("What is your name?") |> String.trim

      # Now, output it

    IO.puts("Hello #{name}")
  end

  #############################################################
  ## INTEGER DATA TYPES
  #############################################################
  def int_stuff do
    i = 123
    IO.puts("Integer? #{is_integer(i)}")
  end

  #############################################################
  ## FLOAT DATA TYPES
  #############################################################
  def float_stuff do
    f = 3.14159
    IO.puts("Float? #{is_float(f)}")
  end

  #############################################################
  ## ATOM DATA TYPES
  #############################################################
  def atom_stuff do
    IO.puts("Atom? #{is_atom(:Pittsburgh)}")
    IO.puts("Atom? #{is_atom(:"New York")}")
  end

  #############################################################
  ## RANGE STUFF
  #############################################################
  def range_stuff do
    one_to_ten = 1..10
    IO.puts(Kernel.inspect(one_to_ten))
      # use "inspect" to convert anything to a String
  end

  #############################################################
  ## STRING STUFF
  #############################################################
  def str_stuff do
    s = "My Sentence"
    IO.puts "Length: #{String.length(s)}" # length of str
    longer = s <> " " <> "is longer"
    IO.puts "Equal? #{"Egg" === "egg"}"
    IO.puts "Contains? #{String.contains?(longer, "My")}"
    IO.puts "First : #{String.first(longer)}"
    IO.puts "Last : #{String.last(longer)}"
    IO.puts "Index 4 : #{String.at(longer, 4)}"
    IO.puts "Substring : #{String.slice(longer, 3, 8)}"
    IO.inspect String.split(longer, " ")
    IO.puts String.reverse(longer)
    IO.puts String.upcase(longer)
    IO.puts String.downcase(longer)
    IO.puts String.capitalize(longer)

    4 * 10 |> IO.puts   # Converted to string by pipe
    IO.puts(Kernel.inspect(1..10))    # no piping in!
      # See `range_stuff` above re:inspect
  end

  #############################################################
  ## MATH STUFF
  #############################################################
  def math_stuff do
    IO.puts "5 + 4 = #{5 + 4}"
    IO.puts "5 - 4 = #{5 - 4}"
    IO.puts "5 * 4 = #{5 * 4}"
    IO.puts "5 / 4 = #{5 / 4}"
    IO.puts "5 div 4 = #{div(5, 4)}"  # div or dividend/divisor
    IO.puts "5 rem 4 = #{rem(5, 4)}"  # "modulus" (e.g.remainder)

    ## See: https://hexdocs.pm/elixir/api-reference.html

  end

  #############################################################
  ## COMPARE STUFF
  #############################################################
  def compare_stuff do
    i = 4     # int
    f = 4.0   # float
    IO.puts("4 == 4.0 : #{i == f}")     # value compare only
    IO.puts("4 === 4.0 : #{i === f}")   # value and data-type
    IO.puts("4 != 4.0 : #{i != f}")     # ibid
    IO.puts("4 !== 4.0 : #{i !== f}")   # ibid

    IO.puts("5 > 4 : #{5 > 4}")
    IO.puts("5 < 4 : #{5 < 4}")
    IO.puts("5 <= 4 : #{5 <= 4}")
    IO.puts("5 >= 4 : #{5 >= 4}")
  end

  #############################################################
  ## CONDITION STUFF
  #############################################################
  def condition_stuff do
    age = 16

    IO.puts("Vote and drive? #{(age >= 16) and (age >= 18)}")
    IO.puts("Vote or drive? #{(age >= 16) or (age >= 18)}")

    if age = 18 do
      IO.puts "Can Vote"
    else
      IO.puts "Cannot Vote"
    end

    unless age === 18 do
      IO.puts "You are not 18"
    else
      IO.puts "You are 18"
    end

    cond do
      age >= 18 -> IO.puts "You can vote"
      age >= 16 -> IO.puts "You can drive"
      age >= 14 -> IO.puts "You can wait"
      true -> IO.puts "Default"
    end

    case 2 do
      1 -> IO.puts "Entered 1"
      2 -> IO.puts "Entered 2"
      nil -> IO.puts "nil"
      _ -> IO.puts "Default"
    end

    ## Turnary operator
    IO.puts "Ternary : #{if age >= 18, do: "Can Vote", else: "Cannot Vote"}"
  end

end
