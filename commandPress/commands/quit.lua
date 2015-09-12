CommandPress:Add("quit", function(text, ply)
  if (ply ~= CommandPress:Me()) then return end

  ply:ConCommand("gamemenucommand quitnoconfirm")
end)
