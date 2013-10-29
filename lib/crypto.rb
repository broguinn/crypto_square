class Crypto

  def initialize(string)
    @crypto_string = string
    @encrypted = ""
  end

  def encrypt
    self.strip
    self.split
    self.build
  end

  def strip
    @crypto_string = @crypto_string.gsub(/[^\w]+/, "").downcase
  end

  def split
    @line_length = (@crypto_string.length ** 0.5).ceil
    @crypto_lines = @crypto_string.scan(/.{1,#{Regexp.escape(@line_length.to_s)}}/)
  end

  def build
    @crypto_lines[0].length.times do |index|
      @crypto_lines.each do |line|
        @encrypted << line[index] if line[index]
      end
    end
    @encrypted.scan(/.{1,5}/).join(" ")
  end
end
