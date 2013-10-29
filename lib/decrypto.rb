class Decrypto
  attr_reader :crypto_lines

  def initialize(string)
    @decrypto_string = string.gsub(/\s/,"")
    @crypto_lines =[]
    @line_length = ((@decrypto_string.length ** 0.5).ceil)
    @column_length = (@decrypto_string.length / @line_length) + 1
    @big_groups = @line_length - ((@line_length * @column_length) - @decrypto_string.length)
    @little_groups = @line_length - @big_groups
    @decrypted = ""
  end

  def decrypt
    self.break
    self.decode
  end

  def break
    @big_groups.times do |group|
      @crypto_lines << @decrypto_string.slice!(0, @column_length)
    end
    @little_groups.times do |group|
      @crypto_lines << @decrypto_string.slice!(0, @column_length - 1)
    end
  end

  def decode
    @crypto_lines[0].length.times do |index|
      @crypto_lines.each do |chunk|
        @decrypted << chunk[index] if chunk[index] != nil
      end
    end
    @decrypted
  end
end
