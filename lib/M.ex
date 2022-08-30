defmodule M do

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

  ## FLOAT DATA TYPES
  def float_stuff do
    f = 3.14159
    IO.puts("Float? #{is_float(f)}")
  end

  ## ATOM DATA TYPE: name same as value
  def atom_stuff do
    IO.puts("Atom? #{is_atom(:Pittsburgh)}")
    IO.puts("Atom? #{is_atom(:"New York")}")
  end

  #############################################################
  ## RANGES
  #############################################################
  def range_stuff do
    one_to_ten = 1..10
    IO.puts(Kernel.inspect(one_to_ten))
      # use "inspect" to convert anything to a String
  end

  #############################################################
  ## STRINGS
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
  end

end
