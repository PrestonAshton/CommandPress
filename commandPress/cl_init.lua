CommandPress:me():SetPData("chatCmdAnnoyOn",  "false")

CommandPress:add("annoy", function(ply, text)
	if  ply:GetPData("chatCmdAnnoyOn", "false") == "false" then
		local targ = CommandPress:resolveName(string.sub(text,8))

		if IsValid(targ) and targ:IsPlayer() then
			if (IsValid(targ:Nick())) then
				prnt("Now annoying: " .. targ:Nick())
				ply:SetPData("chatCmdAnnoyAnnoying", targ:Nick()) end
			timer.Create("annoyTimer", 0.5, 0,function()
				me:ConCommand("aowl goto _"..targ:EntIndex())
			end)
			ply:SetPData("chatCmdAnnoyOn", "true")
		end
	else
		CommandPress:prnt("Stopped getting on the nerves of: " .. ply:GetPData("chatCmdAnnoyAnnoying"))
		ply:SetPData("chatCmdAnnoyAnnoying", "")
		timer.Remove("annoyTimer")
		ply:SetPData("chatCmdAnnoyOn", "false")
	end
end)

hook.Add("PlayerSay", "textHook", function(ply, text)
	local args = {};
	for word in text:gmatch("%w+") do table.insert(args, word) end

	if (text:sub(1, 1) == "!" or text:sub(1, 1) == "/")  then
		if (commands[args[1]:sub(1, args[1]:len())]) then
			local command = commands[args[1]:sub(1, args[1]:len())]

			if (command[2]) then
				timer.Simple(0, function() command[2](ply, text) end );
			end
		end
	end
end)
