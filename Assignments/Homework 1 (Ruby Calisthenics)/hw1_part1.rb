def palindrome?(string)
	string = string.gsub(/\W/,'').downcase
	string  ==  string.reverse
end

def count_words(string)
	hash = {}
	preArray = string.downcase.gsub(/\W/,' ').squeeze(" ").split(%r{\s|\W})
	preArray.each do |word|
		times = preArray.count(word)
		hash[word]=times
	end 
	hash
end
