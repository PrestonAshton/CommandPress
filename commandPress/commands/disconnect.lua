CommandPress:Add("disconnect", function(text, ply)
  if (ply ~= CommandPress:Me()) then return end

  ply:ConCommand("gamemenucommand disconnect")
end)
