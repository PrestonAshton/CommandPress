me:SetPData("chatCmdAnnoyOn",  "false")

addCommand("annoy", function(ply, text)
	if  ply:GetPData("chatCmdAnnoyOn", "false") == "false" then
		local targ = resolveName(string.sub(text,8))

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
		prnt("Stopped getting on the nerves of: " .. ply:GetPData("chatCmdAnnoyAnnoying"))
		ply:SetPData("chatCmdAnnoyAnnoying", "")
		timer.Remove("annoyTimer")
		ply:SetPData("chatCmdAnnoyOn", "false")
	end
end)
