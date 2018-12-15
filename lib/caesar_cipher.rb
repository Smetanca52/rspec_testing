def cipher(arg, key)
  low = ('a'..'z').to_a
  up = ('A'..'Z').to_a
  result = []
  arg.split(//).each do |chr|
    if low.include? chr
      result << low[(low.find_index(chr) + key) % 26]
    elsif up.include? chr
      result << up[(up.find_index(chr) + key) % 26]
    else
      result << chr
    end
  end
  result.join
end
