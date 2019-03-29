require 'io/console'
require_relative 'stages'

# p $stages
stage = 0

puts "-"*20 + "\n\n Welcome to Hangman\n\n" + "-"*20
print "\nSet the word: "

setword = STDIN.noecho(&:gets).chomp
setword = setword.upcase.chars # DEBUG
hiddenword = ("-" * setword.length).chars
letters = []
# def method
#     loop
# end

loop do
    
    puts "\nEnter your best guess OR \n1: Guess the whole word\n2: Quit"
    guess = STDIN.getch.upcase #User can only input one character and they aren't required to press "ENTER" to move on
    
    if guess == "1"
        puts "What is the word?"
        guessword = gets.chomp.upcase.chars
        # check entered word
        if guessword == setword
            system('clear')
            puts "You guessed right\n\nPlay again?\n"
            # puts "(Y)es or (N)o"
            # playagain = gets.chomp.downcase
            # if playagain == "yes", "y"
            #     method
            # else
            #     break
            # end
            break
        else
            puts "Wrong answer"
            break
        end
        
    elsif guess == "2"
        puts "Thanks for playing"
        break
    else
        if setword.include? guess
            setword.each_with_index do |x,i|
                if x == guess
                    hiddenword[i] = x
                end
            end
            system("clear")
            puts hiddenword.join(" ")
            puts "\n\n\n\n\n"
        else
            system("clear")
            stage += 1
            puts hiddenword.join(" ")
            puts "\n\n\n\n\n"
            letters << guess
            hash = Hash.new(0)
            letters.each do |v|
                hash[v] += 1
            end
            hash.each do |k,v|
                if v != 1 
                    letters.pop
                    stage -= 1
                    puts "You have already tried that letter"
                end
            end
        end
    end
    print letters.join(" ")
    puts "\n"
    puts $stages[stage]
    if hiddenword.include?("-") == false or stage == 11
        # hiddenword.include?("-") == false ? "You win" : false
        # stage == 11 ? "You lose" : false
        puts "-"*20 + "\n\n The word was #{setword.join("")}\n\n" + "-"*20
        break
    end
end

