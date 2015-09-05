Say("This should say something if AnHero.lua is actually ran :s")

CommandPress:SetData("chatCmdAnHero", "false")
timer.Remove("anHeroTimer")

CommandPress:add("anhero", function(ply, text)
	if CommandPress:GetData("chatCmdAnHero", "false") == "false" then
		CommandPress:Print("You are an hero")
		timer.Create("anHeroTimer", 0.5, 0, function()
			CommandPress:Me():ConCommand("aowl suicide")
		end)
		CommandPress:SetData("chatCmdAnHero", "true")
	else
		CommandPress:Print("You are no longer an hero")
		timer.Remove("anHeroTimer")
		CommandPress:SetData("chatCmdAnHero", "false")
	end
end)
