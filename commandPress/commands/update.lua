CommandPress:Add("update", function(text, ply)

  if (ply ~= CommandPress:Me()) then return end

	CommandPress:CheckForUpdate()
end)
