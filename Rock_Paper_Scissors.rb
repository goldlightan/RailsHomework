def IsWin(player,com)
	if player == com
		return 0
	elsif player == "0" &&  com == "1"
		return 2
	elsif player == "0" &&  com == "2"
		return 1
	elsif player == "1" &&  com == "2"
		return 2
	elsif player == "1" &&  com == "0"
		return 1
	elsif player == "2" &&  com == "0"
		return 2
	elsif player == "2" &&  com == "1"
		return 1
	end
end

def GetName(text)
	case text
	when "0" then return "Rock"
	when "1" then return "Paper"
	when "2" then return "Scissors"
	end
end

arr = ["0","1","2"]

puts "Welcome to play Rock Paper Scissors"

begin
	puts "please input a number"
	arr.each{|x| puts "    " + x + " : " + GetName(x)}
	input = gets.chomp

	while !arr.include?(input)
		puts "you enter wrong ,please enter again"
		arr.each{|x| puts "    " + x + " : " + GetName(x)}
		input = gets.chomp
	end

	ai = arr.sample

	puts "your enter " + GetName(input) +  " , compter enter " + GetName(ai)

	case IsWin(input,ai)
	when 0 then puts "draw game"
	when 1 then puts "you win"
	when 2 then puts "you lose"
	end

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
end while replay == "Y"

puts "thank you for play the game"