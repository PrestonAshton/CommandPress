hook.Add("OnPlayerChat", "commandRecogniserHook", function(ply, text, teamChat, dead)
	local args = {}
	local nextIndex = 1

	for word in text:gmatch("%w+") do
		args[nextIndex] = word
		nextIndex = nextIndex + 1
	end

	if (text:sub(1, 1) == "!" or text:sub(1, 1) == "/")  then
		if (CommandPress.Commands[args[1]:sub(1, args[1]:len())]) then
			local command = CommandPress.Commands[args[1]:sub(1, args[1]:len())]

			if (command[2]) then
				timer.Simple(0, function() command[2](text) end );
			end
		end
	end
end)
