CommandPress:Add("ping", function(text, ply)
  if (ply == CommandPress:Me()) then
    CommandPress:Say("Pong! My ping is: " .. ply:Ping())
  end
  CommandPress:Say("Pong! Your ping is: " .. ply:Ping() .. ", " .. ply:Nick() .. ". Mine is: " .. CommandPress:Me():Ping())
end)
