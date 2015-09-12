CommandPress:Add("retry", function(text, ply)

  if (ply ~= CommandPress:Me()) then return end

  ply:ConCommand("retry")
end)
