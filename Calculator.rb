def GetResult(op,n1,n2)
	case op
	when 0 then return n1 + n2
	when 1 then return n1 - n2
	when 2 then return n1 * n2
	when 3 then return n1 / n2
	end
end

opArr = ["Addition","Subtraction","Multiplication","Division"]

puts "Welcome to use Ruby Calculator"

puts "Please Enter First Number"
num1 = gets.chomp.to_i

puts "Please Enter Sceond Number"
num2 = gets.chomp.to_i

puts "Please Enter Operation"
opArr.each_index { |x| puts "    " + x.to_s + " : " + opArr[x]}
opInput = gets.chomp.to_i

while ![0,1,2,3].include?(opInput)
	puts "You Enter Worng , Please Enter Again"
	opArr.each_index { |x| puts "    " + x.to_s + " : " + opArr[x]}
	opInput = gets.chomp.to_i
end

puts "Your Result Is : " + GetResult(opInput,num1,num2).to_s