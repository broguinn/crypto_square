require 'rspec'
require 'crypto_square'

describe 'crypto_square' do
  
end

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
    crypto.strip # "jimwalksafinelinebetweensanityandyogamastery"
    crypto.split # ["jimwalk", "safinel", "inebetw", "eensani", "tyandyo", "gamaste", "ry"]
    crypto.build.should eq "jsiet grian eyaym fenam wibsn aanea dslet nytkl wioe"
  end
end

describe 'encrypt' do
  it "wraps strip, split, and build into a single function, passing back the encoded string" do
    crypto = Crypto.new("If man was meant to stay on the ground God would have given us roots")
    crypto.encrypt.should eq "imtgd vsfea rwerm ayoog oanou uiont nnlvt wttdd esaoh ghnss eoau"
  end
end

describe 'decrypt' do
  it "breaks and joins a string to return a series of characters close to the original message" do
    decrypto = Decrypto.new("imtgd vsfea rwerm ayoog oanou uiont nnlvt wttdd esaoh ghnss eoau")
    decrypto.decrypt.should eq "ifmanwasmeanttostayonthegroundgodwouldhavegivenusroots"
  end
end

describe 'break' do
  it "breaks an encrypted string into a reordered array of words" do
    decrypto = Decrypto.new("imtgd vsfea rwerm ayoog oanou uiont nnlvt wttdd esaoh ghnss eoau")
    decrypto.break.should eq ["imtgdvs", "fearwer", "mayoogo", "anouuio", "ntnnlvt", "wttddes", "aohghn", "sseoau"]
  end
end

describe 'decode' do
  it "takes an array of encoded blocks and rearranges them into a decoded string" do
    decrypto = Decrypto.new("imtgd vsfea rwerm ayoog oanou uiont nnlvt wttdd esaoh ghnss eoau")
    decrypto.break
    decrypto.decode.should eq "ifmanwasmeanttostayonthegroundgodwouldhavegivenusroots"
  end
end





