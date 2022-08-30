defmodule ExtutTest do
  use ExUnit.Case
  doctest Extut

  test "greets the world" do
    assert Extut.hello() == :world
  end
end
