local function Setup()
  CommandPress:SetData("chatCmdAutoRevive", "false")
  hook.Remove("Think", "autoReviveTimer")
end

CommandPress:Add("autorevive", function(text)
	if CommandPress:GetData("chatCmdAutoRevive", "false") == "false" then
		CommandPress:Print(HUD_PRINTTALK, "Automatic revive enabled!")
    local me = CommandPress:Me()
		hook.Add("Think", "autoReviveTimer", function()
			if (!me:Alive()) then
				me:ConCommand("aowl revive") end
		end)
		CommandPress:SetData("chatCmdAutoRevive", true)
	else
		CommandPress:Print(HUD_PRINTTALK, "Automatic revive disabled!")
		hook.Remove("Tick", "autoReviveTimer")
		CommandPress:SetData("chatCmdAutoRevive", false)
	end
end)

hook.Add("CommandPressCleanUp", "CleanAutoRevive", function()
  Setup()
end)
