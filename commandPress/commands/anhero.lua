local function Setup()
  CommandPress:SetData("chatCmdAnHero", "false")
  hook.Remove("Think", "anHeroHook")
end

Setup()

CommandPress:Add("anhero", function(text)
	if CommandPress:GetData("chatCmdAnHero", "false") == "false" then
		CommandPress:Print("You are an hero")

    local me = CommandPress:Me();

		hook.Add("Think", "anHeroHook", function()
			me:ConCommand("aowl suicide")
		end)

		CommandPress:SetData("chatCmdAnHero", "true")
	else
		CommandPress:Print("You are no longer an hero")

		hook.Remove("Think", "anHeroHook")
		CommandPress:SetData("chatCmdAnHero", "false")
	end
end)

hook.Add("CommandPressCleanUp", "CleanAnHero", function()
  Setup()
end)
