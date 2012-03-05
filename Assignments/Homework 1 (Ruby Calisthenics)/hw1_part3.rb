def combine_anagrams(words)
	words.sort!{|a,b|b.downcase.chars.sort.join <=> a.downcase.chars.sort.join}
	output = []
	i = 0
	while i < words.length do 
		inOutput = []
		j = i
		inOutput.push(words.at(i))
		j += 1
		while (j<words.length and words.at(j-1).downcase.chars.sort.join == words.at(j).downcase.chars.sort.join) do
			inOutput.push(words.at(j))
			j += 1   #Ruby doesn't sport j++ (bha!)
		end
		i = j
		output.push(inOutput)
	end
	output.sort
end

#A MUCH BETTER and efficient solution (by Ani Saraf)
=begin
def combine_anagrams(words)
	results = Hash.new([]);
  	words.each {|word| results[word.downcase.split(//).sort.join] += [word]}
  	return results.values;	
end
=end