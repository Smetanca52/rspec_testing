require './lib/caesar_cipher.rb'

RSpec.describe  "#cipher" do
  context 'when input string' do
    it "returns shifted letters according to key" do
      expect(cipher('hello', 4)).to eql('lipps')
    end
  end

  context 'when input string with big letters' do
    it "returns shifted letters with same case" do
      expect(cipher('HELLO', 4)).to eql('LIPPS')
    end
  end

  context 'when input string and numbers' do
    it "returns shifted letters, numbers don`t change" do
      expect(cipher('Hello1', 9)).to eql('Qnuux1')
    end
  end

  context 'when input string and symbols' do
    it "returns shifted letters, symbols don`t change" do
      expect(cipher('Hello!', 4)).to eql('Lipps!')
    end
  end

  context 'when input multiple strings' do
    it "returns shifted letters in all words, respecting spaces and case" do
      expect(cipher('Hello World of Warcraft!', 4)).to eql('Lipps Asvph sj Aevgvejx!')
    end
  end
end
