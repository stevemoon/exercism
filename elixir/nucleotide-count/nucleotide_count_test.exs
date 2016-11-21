if !System.get_env("EXERCISM_TEST_EXAMPLES") do
<<<<<<< HEAD
  Code.load_file("nucleotide_count.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule NucleotideCountTest do
  use ExUnit.Case

  # @tag :pending
  test "empty dna string has no adenine" do
    assert NucleotideCount.count('', ?A) == 0
  end

  @tag :pending
  test "repetitive cytosine gets counted" do
    assert NucleotideCount.count('CCCCC', ?C) == 5
  end

  @tag :pending
  test "counts only thymine" do
    assert NucleotideCount.count('GGGGGTAACCCGG', ?T) == 1
=======
  Code.load_file("dna.exs")
end

ExUnit.start
ExUnit.configure trace: true
#ExUnit.configure exclude: :pending, trace: true

defmodule DNATest do
  use ExUnit.Case

  # @tag :pending
  test "empty dna string has no adenosine" do
    assert DNA.count('', ?A) == 0
  end

  @tag :pending
  test "repetitive cytidine gets counted" do
    assert DNA.count('CCCCC', ?C) == 5
  end

  @tag :pending
  test "counts only thymidine" do
    assert DNA.count('GGGGGTAACCCGG', ?T) == 1
>>>>>>> origin/master
  end

  @tag :pending
  test "empty dna string has no nucleotides" do
    expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
<<<<<<< HEAD
    assert NucleotideCount.histogram('') == expected
  end

  @tag :pending
  test "repetitive sequence has only guanine" do
    expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 8}
    assert NucleotideCount.histogram('GGGGGGGG') == expected
=======
    assert DNA.histogram('') == expected
  end

  @tag :pending
  test "repetitive sequence has only guanosine" do
    expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 8}
    assert DNA.histogram('GGGGGGGG') == expected
>>>>>>> origin/master
  end

  @tag :pending
  test "counts all nucleotides" do
    s = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
    expected = %{?A => 20, ?T => 21, ?C => 12, ?G => 17}
<<<<<<< HEAD
    assert NucleotideCount.histogram(s) == expected
=======
    assert DNA.histogram(s) == expected
  end

  @tag :pending
  test "histogram validates the strand" do
    assert_raise ArgumentError, fn ->
      DNA.histogram('JOHNNYAPPLESEED')
    end
  end

  @tag :pending
  test "count validates the nucleotide" do
    assert_raise ArgumentError, fn ->
      DNA.count('', ?U)
    end
  end

  @tag :pending
  test "count validates the strand" do
    assert_raise ArgumentError, fn ->
      DNA.count('JOHNNYAPPLESEED', ?A)
    end
>>>>>>> origin/master
  end
end
