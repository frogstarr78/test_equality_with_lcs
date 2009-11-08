require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "TestEqualityWithLcs" do
  it "passes" do
    'actual'.should be_equal_with_lcs('actual')
  end

  it "doesn't pass" do
    'actual'.should_not be_equal_with_lcs('something else so this test will fail and we can test the resulting string')
  end

  it "get's correct output" do
    self.class.colorize = false
    # careful of the whitespace required here.
    expected_error = "---------------------------------- ---------- --- ----------- + -----------
                                  a          c   t           ual           
something else so this test will fail and we can test the resu lting string"
    lambda{ 
      'actual'.should be_equal_with_lcs('something else so this test will fail and we can test the resulting string')
    }.should raise_error(Spec::Expectations::ExpectationNotMetError, expected_error)
  end

  it "get's correct output with multi-line string comparison" do
    self.class.colorize = false
    # careful of the whitespace required here.
    seq1 = "actual
ly
I
didn't want it all
on one
line"
    seq2 = "actually I did want it on ...
well a couple lines."

    expected_error = "      -----------------------
actual                       
actually I did want it on ...
-- !----------------
  ly                
well a couple lines."
    lambda{ 
      seq1.should be_equal_with_lcs(seq2)
    }.should raise_error(Spec::Expectations::ExpectationNotMetError, expected_error)
  end
end
