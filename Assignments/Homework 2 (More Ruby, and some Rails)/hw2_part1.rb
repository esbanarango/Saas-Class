# => a)
class Numeric
	@@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  	def method_missing(method_id)
    	singular_currency = method_id.to_s.gsub( /s$/, '')
    	if @@currencies.has_key?(singular_currency)
      		self * @@currencies[singular_currency]
    	else
      		super
    	end
  	end
  	# Apparently, it is implicit that the Numeric amount is in dollars: 
  	# => 10.dollars == 10
  	# => 10.euros == 10.dollars * 1.292 
  	def in(arg)
  		concurrency = arg.to_s.gsub( /s$/, '')
  		(concurrency.to_s == "dollar")?self.send(arg.to_s):self/@@currencies[concurrency]
  	end	
end

# => b)
class String
	def palindrome?()
		string = self.to_s
		string = string.gsub(/\W/,'').downcase
		string  ==  string.reverse
	end
end

# => c)
module Enumerable
	# Tried with 'self.to_s.palindrome?'' but failed with 'enumerable palindrome? should still work for the case of non-array 
	# enumerables that do make sense, like iterators'
	def palindrome?
	  	aPalindrome = self.map { |e| e }
	  	aPalindrome == aPalindrome.reverse
  	end
end

