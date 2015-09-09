CommandPress:Add("ping", function(text, ply)
  CommandPress:Say("Pong! Your ping is: " .. ply:Ping())
end)
