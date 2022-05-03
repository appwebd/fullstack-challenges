def beer_song(beer_start_count)
  remaining_beers = beer_start_count

  while remaining_beers.positive?
    puts "#{bottles(remaining_beers)} of beer on the wall, #{bottles(remaining_beers)} of beer!"
    remaining_beers -= 1
    puts "Take one down, pass it around, #{bottles(remaining_beers)} of beer on the wall!"
  end
end

def bottles(count)
  case count
  when 0 then 'no more bottles'
  when 1 then '1 bottle'
  else
    "#{count} bottles"
  end
end

beer_song(ARGV[0].to_i)
