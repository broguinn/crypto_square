
class Crypto

  def initialize(string)
    @crypto_string = string
  end

  def strip
    @crypto_string = @crypto_string.gsub(/[^\w]+/, "").downcase
  end

  def split
    @line_length = (@crypto_string.length ** 0.5).ceil

    @crypto_lines = @crypto_string.scan(/.{1,#{Regexp.escape(@line_length.to_s)}}/)
  end

  def build
    @crypto_lines_split = @crypto_lines.map { |line| line.split("")}

    @encrypted = ""

    @crypto_lines[0].length.times do |index|
      @crypto_lines.each do |line|
        @encrypted << line[index] if line[index] != nil
      end
    end

    @encrypted = @encrypted.scan(/.{1,5}/).join(" ")
  end

  def encrypt
    self.strip
    self.split
    self.build
  end
end

class Decrypto

  def initialize(string)
    @decrypto_string = string
  end

  def decrypt
    self.break
    self.decode
  end

  def break
    @decrypto_string.gsub!(/\s/,"")

    @crypto_lines_split =[]

    line_length = ((@decrypto_string.length ** 0.5).ceil)
    column_length = (@decrypto_string.length / line_length) + 1
    big_groups = line_length - ((line_length * column_length) - @decrypto_string.length)
    little_groups = line_length - big_groups

    big_groups.times do |group|
      @crypto_lines_split << @decrypto_string.slice!(0, column_length)
    end

    little_groups.times do |group|
      @crypto_lines_split << @decrypto_string.slice!(0, column_length - 1)
    end

    @crypto_lines_split
  end

  def decode
    @decrypted = ""

    @crypto_lines_split[0].length.times do |index|
      @crypto_lines_split.each do |chunk|
        @decrypted << chunk[index] if chunk[index] != nil
      end
    end

    @decrypted
  end
end


