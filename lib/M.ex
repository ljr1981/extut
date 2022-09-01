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
    :ok
  end

  #############################################################
  ## INTEGER DATA TYPES
  #############################################################
  def int_stuff do
    i = 123
    IO.puts("Integer? #{is_integer(i)}")
    :ok
  end

  #############################################################
  ## FLOAT DATA TYPES
  #############################################################
  def float_stuff do
    f = 3.14159
    IO.puts("Float? #{is_float(f)}")
    :ok
  end

  #############################################################
  ## ATOM DATA TYPES
  #############################################################
  def atom_stuff do
    IO.puts("Atom? #{is_atom(:Pittsburgh)}")
    IO.puts("Atom? #{is_atom(:"New York")}")
    :ok
  end

  #############################################################
  ## RANGE STUFF
  #############################################################
  def range_stuff do
    one_to_ten = 1..10
    IO.puts(Kernel.inspect(one_to_ten))
      # use "inspect" to convert anything to a String
      :ok
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
    :ok
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
    :ok
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
    :ok
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

    # The conditions are commented out to prevent a compiler complaint:
    # warning: this clause cannot match because a previous clause at
    #   line 142 always matches
    #   lib/M.ex:143
    cond do
      #      age >= 18 -> IO.puts "You can vote"
      #      age >= 16 -> IO.puts "You can drive"
      #      age >= 14 -> IO.puts "You can wait"
      true -> IO.puts "Default"
    end

    case 2 do
      1 -> IO.puts "Entered 1"
      2 -> IO.puts "Entered 2"
      _ -> IO.puts "Default"
    end

    ## Turnary operator
    IO.puts "Ternary : #{if age >= 18, do: "Can Vote", else: "Cannot Vote"}"
    :ok
  end

  #############################################################
  ## CONDITION STUFF
  #############################################################
  def tuple_stuff do
    my_stats = {200, 6.0, :Larry}
    IO.puts "Tuple : #{is_tuple(my_stats)}"

    # Tut says cannot do the below, but apparently I can.
    my_stats = Tuple.append(my_stats, 42)

    # And it works again. I am thinking I can change variables.
    IO.puts "Age : #{elem(my_stats, 3)}"

    IO.puts "Size : #{tuple_size(my_stats)}"

    my_stats = Tuple.delete_at(my_stats, 0)

    _my_stats = Tuple.insert_at(my_stats, 0, 1963)

    _many_zeros = Tuple.duplicate(0, 5) # five zeros

    # This works because `{weight, size, name}` is in the last-data-buffer (?)
    {weight, size, name} = {200, 6.0, "Larry"}
    IO.puts "Weight : #{weight}"
    IO.puts "Size : #{size}"
    IO.puts "Name : #{name}"
    :ok
  end

  #############################################################
  ## LIST STUFF
  #############################################################
  def list_stuff do
    # Make two lists to work with.
    list1 = [1,2,3]
    list2 = [4,5,6]

    # Combine
    list3 = list1 ++ list2    # add or append list2 to list1
    IO.puts "List3 : #{IO.inspect(list3)}"
    # iex> List3 : ^A^B^C^D^E^F     # The output of list3 raw (binary?)

    # remove list1 from list3
    list4 = list3 -- list1

    # verify if item in list
    IO.puts 6 in list4

    [head | tail] = list3
    IO.puts "Head : #{head}"    # Head is okay as-is, but ...
    IO.write "Tail : #{tail}"   # then tail, but ...
    IO.inspect tail             # to get tail to look like head in IO

    IO.inspect [97,98]                          # = 'ab'
    # vs
    IO.inspect [97,98], charlists: :as_lists    # [97,98]

    # Erlang note: What the last value of the FN is will print out in iex

    Enum.each tail, fn item ->
      IO.puts item
    end

    words = ["Random", "words", "in a", "list"]
    Enum.each words, fn word ->
      IO.puts word
    end

    # Recursion using function
    IO.puts "One way ..."
    display_list(words)
    IO.puts "or another"
    display_list2(words)
    :ok
  end

  # One way of doing recursive calls
  def display_list([word|words]) do     # in-arg-proc -> break head|tail (e.g. word|words)
    IO.puts word                        # display the word (head)
    display_list(words)                 # Recursive call ... until ...
  end
  def display_list([]), do: nil         # When arg is empty list (e.g. []), then ...

  # Another way that does not include two functions
  def display_list2(words) do
    [word|words] = words
    IO.puts word
    unless Enum.empty?(words) do
      display_list2(words)
    end
  end

  #############################################################
  ## MAP STUFF
  #############################################################
  def map_stuff do
    capitols = %{"Alabama" => "Montgomery",
      "Alaska" => "Juneau", "Arizona" => "Phoenix"}

    # Fetch value for key from `capitols`
    IO.puts "Capitol of Alaska is #{capitols["Alaska"]}"

    capitols = %{alabama: "Montgomery",
      alaska: "Juneau", arizona: "Phoenix"}

    # Fetch another always (e.g. atom keys must be lower case)
    IO.puts "Capitol of Arizona is #{capitols.arizona}"

    capitols = Map.put_new(capitols, "Arkansas", "Little Rock")
    IO.puts "New item Arkansas capitol is #{capitols["Arkansas"]}"
    # IO.puts "Another way is #{capitols.arkansas}" ## This failed because ...
    # iex> %{:alabama => "Montgomery", :alaska => "Juneau", :arizona => "Phoenix", "Arkansas" => "Little Rock"}
    # The data is now mixed-and-matched, which violates what was expected.
    :ok
  end

  #############################################################
  ## PATTERN-MATCHING STUFF
  #############################################################
  def pattern_stuff do
    [length,width] = [20,30]
    IO.puts "Length = #{length} and Width = #{width}"

    [_,[_,a]] = [20,[30,40]]
    IO.puts "Get num : #{a}"
    :ok
  end

  #############################################################
  ## PATTERN-MATCHING STUFF
  #############################################################
  def anon_stuff do
    get_sum = fn(x,y) -> x + y end
    IO.puts "X=10, Y=16 #{get_sum.(10,16)}"

    # Let's do it in "shorthand" ...
    get_less = &(&1 - &2)
    IO.puts "X=10, Y=16 #{get_less.(10,16)}"

    add_sum = fn
      {x,y} -> IO.puts "#{x} + #{y} = #{x+y}"
      {x,y,z} -> IO.puts "#{x} + #{y} + #{z} = #{x+y+z}"
    end

    add_sum.({1,2})
    add_sum.({1,2,3})

    IO.puts with_defaults()
  end

  # See `anon_stuff`
  def with_defaults(x \\ 1, y \\ 1) do
    x+y
  end

  #############################################################
  ## RECURSION STUFF
  #############################################################
  def recur_stuff do
    IO.puts "Factorial of 3 = #{factorial(3)}"
    :ok
  end

  def factorial(num) do
    if num <= 1 do
      1
    else
      result = num * factorial(num - 1)
      result    # only reason to add this line is to stop compiler-warn
    end
  end

  #############################################################
  ## LOOPING STUFF
  #############################################################
  def loopy_stuff do
    IO.puts "Sum : #{sum([1,2,3,4])}"

    loop(5,1)
    :ok
  end

  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)

  # Alt to making two fn's (like above for `sum`)
  def loop(max, min) do
    case max do
      0 -> nil
      _ -> if max < min do
        loop(0, min)
      else
        IO.puts "Num : #{max}"
        loop(max - 1, min)
      end
    end
  end

  #############################################################
  ## ENUM STUFF
  #############################################################
  def enum_stuff do
    # All items are even in a list ...
    IO.puts "Even List : #{Enum.all?([1,2,3],
    fn(n) -> rem(n, 2) == 0 end)}"

    # If any items are even in a list ...
    IO.puts "Any are Even : #{Enum.any?([1,2,3],
    fn(n) -> rem(n, 2) == 0 end)}"

    # Use Enum.each to print out the values in a list.
    Enum.each([1,2,3], fn(n) -> IO.puts n end)

    # Use Enum.map to create a second list with doubled-values.
    dbl_list = Enum.map([1,2,3], fn(n) -> n * 2 end)
    IO.inspect dbl_list

    # Use Enum.reduce to sum up the values in a list.
    sum_vals = Enum.reduce([1,2,3], fn(n, sum) -> n + sum end)
    IO.inspect sum_vals

    # Give a unique list of values from a list with dupes.
    # Note how I did not put the Enum list into a local variable.
    IO.inspect Enum.uniq([1,1,2,2,3,3])

    :ok       ## Added here so that final value doesn't just repeat.
              ## Provides me an indication that the function ended OK.
  end

  #############################################################
  ## LIST-COMPREHENSION STUFF (FOR loops?)
  #############################################################
  def compre_stuff do
    # Another way to perform actions on a list.
    # <target> = for <n> <- <list_expr>, do: <result_expr>
    dbl_list = for n <- [1,2,3], do: n * 2
    IO.inspect dbl_list

    # for <n> <- <list_expr>, <bool_cond>, do: <result_expr>
    even_list = for n <- [1,2,3,4], rem(n, 2) == 0, do: n
    IO.inspect even_list

    :ok
  end

  #############################################################
  ## EXCEPTION-HANDLING STUFF
  #############################################################
  def ex_stuff do
    err = try do
      5 / 1       # Change to 5 / 0 for demo (otherwise leave as 1 skipping warning)
    rescue
      ArithmeticError -> "Cannot divide by zero"
    end
    IO.puts err

    :ok
  end

  #############################################################
  ## CONCURRENCY STUFF
  #############################################################
  def conc_stuff do
    # Create (spawn) a new process that will run at an indeterminate time.
    spawn(fn() -> loop(5, 1) end)
    spawn(fn() -> loop(10, 5) end)

    # Send a message (in this case—to self)
    send(self(), {:french, "Bob"})

    receive do
      {:german, name} -> IO.puts "Guten tag #{name}"
      {:french, name} -> IO.puts "Bon jour #{name}"
      {:english, name} -> IO.puts "Hello #{name}"
    after
      500 -> "Time's up!"
    end

    :ok   # NOTE how this atom prints but the spawns keep running after this finishes.
  end

  ## For calling M.main in iex command prompt.
  def main do
    conc_stuff()
    :ok
  end

end
