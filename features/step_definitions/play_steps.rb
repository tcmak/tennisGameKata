And /^player(\d+) is "([^\"]*)"$/ do |player, name|
  touch("view marked:'player"+player+"name'")
  wait_for_keyboard()
  keyboard_enter_text name
  uia_enter
end

When /^player1 scored (\d+) times and player2 scored (\d+) times$/ do |player1ScoredTimes, player2ScoredTimes|
  $i = 0
  begin
    if player1ScoredTimes.to_i > $i
      touch("view marked:'player1score'")
    end
    if player2ScoredTimes.to_i > $i
      touch("view marked:'player2score'")
    end
  $i += 1
  end while $i < player1ScoredTimes.to_i || $i < player2ScoredTimes.to_i
end
