require 'rspec'
require 'decrypto'

describe 'Decrypto' do
  describe 'decrypt' do
    it "breaks and joins a string to return a series of characters close to the original message" do
      decrypto = Decrypto.new("imtgd vsfea rwerm ayoog oanou uiont nnlvt wttdd esaoh ghnss eoau")
      decrypto.decrypt.should eq "ifmanwasmeanttostayonthegroundgodwouldhavegivenusroots"
    end
  end

  describe 'break' do
    it "breaks an encrypted string into a reordered array of words" do
      decrypto = Decrypto.new("imtgd vsfea rwerm ayoog oanou uiont nnlvt wttdd esaoh ghnss eoau")
      decrypto.break
      decrypto.crypto_lines.should eq ["imtgdvs", "fearwer", "mayoogo", "anouuio", "ntnnlvt", "wttddes", "aohghn", "sseoau"]
    end
  end

  describe 'decode' do
    it "takes an array of encoded blocks and rearranges them into a decoded string" do
      decrypto = Decrypto.new("imtgd vsfea rwerm ayoog oanou uiont nnlvt wttdd esaoh ghnss eoau")
      decrypto.break
      decrypto.decode.should eq "ifmanwasmeanttostayonthegroundgodwouldhavegivenusroots"
    end
  end
end
