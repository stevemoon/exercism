if !System.get_env("EXERCISM_TEST_EXAMPLES") do
<<<<<<< HEAD
  Code.load_file("leap.exs", __DIR__)
=======
  Code.load_file("leap.exs")
>>>>>>> origin/master
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule LeapTest do
  use ExUnit.Case

  # @tag :pending
  test "vanilla leap year" do
    assert Year.leap_year?(1996)
  end

<<<<<<< HEAD
  @tag :pending
=======
  #  @tag :pending
>>>>>>> origin/master
  test "any old year" do
    refute Year.leap_year?(1997), "1997 is not a leap year."
  end

<<<<<<< HEAD
  @tag :pending
=======
  #@tag :pending
>>>>>>> origin/master
  test "century" do
    refute Year.leap_year?(1900), "1900 is not a leap year."
  end

<<<<<<< HEAD
  @tag :pending
=======
  #@tag :pending
>>>>>>> origin/master
  test "exceptional century" do
    assert Year.leap_year?(2400)
  end
end
