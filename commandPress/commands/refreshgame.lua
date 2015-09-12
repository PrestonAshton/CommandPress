CommandPress:Add("refreshgame", function(text, ply)

  if (ply ~= CommandPress:Me()) then return end

  ply:ConCommand("record cmdPressGameRefresh; stop")
end)
