NUMBERS = ( 1..100 ).to_a
QUIT    = 'q'

def make_guess(number, guess)
  if guess > number
    'too high'
  elsif guess < number
    'too low'
  end
  guess == number
end

def start_round(round)
  system "clear"
  puts "round #{round}"
  number = NUMBERS.shuffle!.first

  while true
    puts "please make a guess (1~100,quit: #{QUIT}):"

    guess = gets.chomp!
    return if guess == QUIT
    
    unless guess =~ /\A\d+\Z/
      puts "oops! not a number"
      next
    end

    break if make_guess(number, guess.to_i)
  end
  start_round(round+1)
end
start_round(1)
