class WrongNumberOfPlayersError < StandardError ; end 
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	strategy = /(r|p|s)/i
	rules = {"r"=>["s"],"s"=>["p"],"p"=>["r"]}

	raise WrongNumberOfPlayersError unless game.length == 2 
	game.each {|p,s| raise NoSuchStrategyError unless  s =~ strategy} 

	if(game[0][1].casecmp(game[1][1]) == 0)
		return game[0]
	else
		if(rules[game[0][1].downcase].include?(game[1][1].downcase))
			return game[0]
		else
			return game [1]
		end	
	end		
end

def rps_tournament_winner(game)
	if (game[0][0].is_a?(String))	#2^1 Tournament
		return rps_game_winner(game)
	else							#2^n Tournament, a simple recursion
		return rps_tournament_winner([rps_tournament_winner(game[0]),rps_tournament_winner(game[1])])
	end
end
