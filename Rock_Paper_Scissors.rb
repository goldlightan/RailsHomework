class Player

	def initialize(name)
		@name = name
		@ken = 0
		@win = 0
	end

	def GetName
		return @name
	end

	def GetKen
		return @ken
	end

	def GetWin
		return @win
	end

	def AddWin
		@win = @win + 1
	end
end

class HuamnPlayer < Player

	def Punch
		@ken = gets.chomp.to_i
		return @ken
	end
end

class AIPlayer < Player

	def Punch
		@ken = [0,1,2].sample
		return @ken
	end
end

class RPS_Game

	@@KenList = ["Rock","Paper","Scissors"]

	def initialize
		self.Welcome

		puts "please enter first player name"
		name1 = gets.chomp
		@p1 = HuamnPlayer.new(name1)

		puts "please enter second player name"
		name2 = gets.chomp
		@p2 = AIPlayer.new(name2)
	end

	def Welcome
		puts "Welcome to play Rock Paper Scissors"
	end

	def AskKenMessage
		puts "please enter your ken"
	end

	def AskKenAgainMessage
		puts "enter wrong , please enter again"
	end

	def AskFirstPlayer
		self.AskKenMessage
		self.TipMessage
		ken = @p1.Punch

		while !self.IsLegal(ken)
			self.AskKenAgainMessage
			self.TipMessage
			ken = @p1.Punch
		end
	end

	def AskSecondPlayer
		ken = @p2.Punch
	end

	def TipMessage
		@@KenList.each_index{|x| puts "    " + x.to_s + " : " + @@KenList[x]}
	end
	
	def Result

		puts @p1.GetName + " enter " + @@KenList[@p1.GetKen] + " , " + @p2.GetName +  " enter " + @@KenList[@p2.GetKen]

		case IsWin(@p1.GetKen,@p2.GetKen)
			when 0 then puts "draw game"
			when 1 
				puts @p1.GetName + " win"
				@p1.AddWin
			when 2 
				puts @p2.GetName + " win"
				@p2.AddWin
		end

		puts "======================="
		puts @p1.GetName + " win " + @p1.GetWin.to_s + " times"
		puts @p2.GetName + " win " + @p2.GetWin.to_s + " times"
		puts "======================="
	end

	def EndMessage
		puts "thank you for play the game"
	end

	def Again?
		puts "Play again?"
		puts "    Y : Play again"
		puts "    N : Finish"
		replay = gets.chomp.upcase

		while !["Y","N"].include?(replay)
			puts "you enter wrong ,please enter again"
			puts "    Y : Play again"
			puts "    N : Finish"
			replay = gets.chomp.upcase
		end

		return replay
	end

	def IsLegal(k)
		return [0,1,2].include?(k)
	end

	def IsWin(player,com)
		if player == com
			return 0
		elsif player == 0 &&  com == 1
			return 2
		elsif player == 0 &&  com == 2
			return 1
		elsif player == 1 &&  com == 2
			return 2
		elsif player == 1 &&  com == 0
			return 1
		elsif player == 2 &&  com == 0
			return 2
		elsif player == 2 &&  com == 1
			return 1
		end
	end
end

#==========================================
myGame = RPS_Game.new;

begin
	ken01 = myGame.AskFirstPlayer

	ken02 = myGame.AskSecondPlayer

	myGame.Result
	
	replay = myGame.Again?

end while replay == "Y"

myGame.EndMessage