require 'rspec'
require 'crypto'

describe 'Crypto' do
  describe 'strip' do
    it "strips a string of non-word characters" do
      crypto = Crypto.new("a fine day, indeed!\n exclaimed he; supposedly...")
      crypto.strip.should eq "afinedayindeedexclaimedhesupposedly"
      crypto = Crypto.new("I live at 123 downy street.")
      crypto.strip.should eq "iliveat123downystreet"
    end

    it "downcases the string" do
      crypto = Crypto.new("What Kingdom are Ye from Sir Arthur II")
      crypto.strip.should eq "whatkingdomareyefromsirarthurii"
    end
  end

  describe 'split' do
    it "splits a string into an array of lines that make up a square" do
      crypto = Crypto.new("FIDO")
      crypto.strip
      crypto.split.should eq ["fi", "do"]
    end
  end

  describe 'build' do
    it "constructs a string from the split characters in groups of five, with spaces in between" do
      crypto = Crypto.new("Jim walks a fine line between sanity and yoga mastery")
      crypto.strip
      crypto.split
      crypto.build.should eq "jsiet grian eyaym fenam wibsn aanea dslet nytkl wioe"
    end
  end

  describe 'encrypt' do
    it "wraps strip, split, and build into a single function, passing back the encoded string" do
      crypto = Crypto.new("If man was meant to stay on the ground God would have given us roots")
      crypto.encrypt.should eq "imtgd vsfea rwerm ayoog oanou uiont nnlvt wttdd esaoh ghnss eoau"
    end
  end
end
