local function Setup()
	CommandPress:SetData("chatCmdAnnoyAnnoying", "")
	hook.Remove("Think", "annoyHook")
	CommandPress:SetData("chatCmdAnnoyOn", "false")
end

Setup()

CommandPress:Add("annoy", function(text, ply)

  if (ply ~= CommandPress:Me()) then return end

	if CommandPress:GetData("chatCmdAnnoyOn", "false") == "false" then
		local targ = CommandPress:ResolveName(string.sub(text,8))

		if IsValid(targ) and targ:IsPlayer() then
			CommandPress:Print("Now annoying: " .. targ:Nick())
			CommandPress:SetData("chatCmdAnnoyAnnoying", targ:Nick())
			local me = CommandPress:Me()
			hook.Add("Think", "annoyHook", function()
				me:ConCommand("aowl goto _"..targ:EntIndex())
			end)
			CommandPress:SetData("chatCmdAnnoyOn", "true")
		end
	else
		CommandPress:Print("Stopped getting on the nerves of: " .. CommandPress:GetData("chatCmdAnnoyAnnoying"))
		Setup()
	end
end)

hook.Add("CommandPressCleanUp", "CleanAnnoy", function()
  Setup()
end)
