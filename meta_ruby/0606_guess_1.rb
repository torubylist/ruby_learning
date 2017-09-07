def make_guess
  a = rand(1..100)
  b = -1
  while (a != b)
    puts ">>please input number(1..100),enter 'q' to quit:"
    b = gets.chomp
    return if b == 'q'
    if b.to_i > a
      puts 'too high'
    elsif b.to_i < a
      puts 'too low'
    else
      puts "You got the answer,#{b}"
      return
    end
  end
end
make_guess
