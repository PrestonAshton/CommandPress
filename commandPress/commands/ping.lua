CommandPress:Add("ping", function(text, ply)
  CommandPress:Say("Pong! Your ping is: " .. ply:Ping() .. ", " .. ply:Nick() .. ". Mine is: " .. CommandPress:Me():Ping())
end)
