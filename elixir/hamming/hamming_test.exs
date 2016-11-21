if !System.get_env("EXERCISM_TEST_EXAMPLES") do
<<<<<<< HEAD
  Code.load_file("hamming.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule HammingTest do
  use ExUnit.Case

  test "no difference between empty strands" do
    assert Hamming.hamming_distance('', '') == {:ok, 0}
=======
  Code.load_file("hamming.exs")
end

ExUnit.start
ExUnit.configure trace: true
#ExUnit.configure exclude: :pending, trace: true

defmodule DNATest do
  use ExUnit.Case

  test "no difference between empty strands" do
    assert DNA.hamming_distance('', '') == {:ok, 0}
>>>>>>> origin/master
  end

  @tag :pending
  test "no difference between identical strands" do
<<<<<<< HEAD
    assert Hamming.hamming_distance('GGACTGA', 'GGACTGA') == {:ok, 0}
=======
    assert DNA.hamming_distance('GGACTGA', 'GGACTGA') == {:ok, 0}
>>>>>>> origin/master
  end

  @tag :pending
  test "small hamming distance in middle somewhere" do
<<<<<<< HEAD
    assert Hamming.hamming_distance('GGACG', 'GGTCG') == {:ok, 1}
=======
    assert DNA.hamming_distance('GGACG', 'GGTCG') == {:ok, 1}
>>>>>>> origin/master
  end

  @tag :pending
  test "distance with same nucleotides in different locations" do
<<<<<<< HEAD
    assert Hamming.hamming_distance('TAG', 'GAT') == {:ok, 2}
=======
    assert DNA.hamming_distance('TAG', 'GAT') == {:ok, 2}
>>>>>>> origin/master
  end

  @tag :pending
  test "larger distance" do
<<<<<<< HEAD
    assert Hamming.hamming_distance('ACCAGGG', 'ACTATGG') == {:ok, 2}
=======
    assert DNA.hamming_distance('ACCAGGG', 'ACTATGG') == {:ok, 2}
>>>>>>> origin/master
  end

  @tag :pending
  test "hamming distance is undefined for strands of different lengths" do
<<<<<<< HEAD
    assert {:error, "Lists must be the same length"} = Hamming.hamming_distance('AAAC', 'TAGGGGAGGCTAGCGGTAGGAC')
    assert {:error, "Lists must be the same length"} = Hamming.hamming_distance('GACTACGGACAGGACACC', 'GACATCGC')
=======
    assert {:error, "Lists must be the same length."} = DNA.hamming_distance('AAAC', 'TAGGGGAGGCTAGCGGTAGGAC')
    assert {:error, "Lists must be the same length."} = DNA.hamming_distance('GACTACGGACAGGACACC', 'GACATCGC')
>>>>>>> origin/master
  end
end
