if !System.get_env("EXERCISM_TEST_EXAMPLES") do
<<<<<<< HEAD
  Code.load_file("rna_transcription.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule RNATranscriptionTest do
=======
  Code.load_file("dna.exs")
end

ExUnit.start
ExUnit.configure trace: true
#ExUnit.configure exclude: :pending, trace: true

defmodule DNATest do
>>>>>>> origin/master
  use ExUnit.Case

  # @tag :pending
  test "transcribes guanine to cytosine" do
<<<<<<< HEAD
    assert RNATranscription.to_rna('G') == 'C'
=======
    assert DNA.to_rna('G') == 'C'
>>>>>>> origin/master
  end

  @tag :pending
  test "transcribes cytosine to guanine" do
<<<<<<< HEAD
    assert RNATranscription.to_rna('C') == 'G'
=======
    assert DNA.to_rna('C') == 'G'
>>>>>>> origin/master
  end

  @tag :pending
  test "transcribes thymidine to adenine" do
<<<<<<< HEAD
    assert RNATranscription.to_rna('T') == 'A'
=======
    assert DNA.to_rna('T') == 'A'
>>>>>>> origin/master
  end

  @tag :pending
  test "transcribes adenine to uracil" do
<<<<<<< HEAD
    assert RNATranscription.to_rna('A') == 'U'
=======
    assert DNA.to_rna('A') == 'U'
>>>>>>> origin/master
  end

  @tag :pending
  test "it transcribes all dna nucleotides to rna equivalents" do
<<<<<<< HEAD
    assert RNATranscription.to_rna('ACGTGGTCTTAA') == 'UGCACCAGAAUU'
=======
    assert DNA.to_rna('ACGTGGTCTTAA') == 'UGCACCAGAAUU'
>>>>>>> origin/master
  end
end
