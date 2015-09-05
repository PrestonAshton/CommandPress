CommandPress:me():SetPData("chatCmdAnnoyOn",  "false")

addCommand("annoy", function(ply, text)
	if  CommandPress:me():GetPData("chatCmdAnnoyOn", "false") == "false" then
		local targ = resolveName(string.sub(text,8))

		if IsValid(targ) and targ:IsPlayer() then
			if (IsValid(targ:Nick())) then
				prnt("Now annoying: " .. targ:Nick())
				CommandPress:me():SetPData("chatCmdAnnoyAnnoying", targ:Nick()) end
			timer.Create("annoyTimer", 0.5, 0,function()
				CommandPress:me():ConCommand("aowl goto _"..targ:EntIndex())
			end)
			CommandPress:me():SetPData("chatCmdAnnoyOn", "true")
		end
	else
		prnt("Stopped getting on the nerves of: " .. ply:GetPData("chatCmdAnnoyAnnoying"))
		CommandPress:me():SetPData("chatCmdAnnoyAnnoying", "")
		timer.Remove("annoyTimer")
		CommandPress:me():SetPData("chatCmdAnnoyOn", "false")
	end
end)
