local function Setup()
  CommandPress:SetData("chatCmdAutoAmmo", "false")
  hook.Remove("Think", "autoAmmoTimer")
end

CommandPress:Add("autoammo", function(text)
	if CommandPress:GetData("chatCmdAutoAmmo", "false") == "false" then
		CommandPress:Print("Automatic ammo giving enabled!")
		hook.Add("Think", "autoAmmoTimer", function()
			local wep = CommandPress:Me():GetActiveWeapon()
			if (!IsValid(me)) then return end

			if (CommandPress:Me():GetAmmoCount(wep:GetPrimaryAmmoType()) < 9999) then
				CommandPress:Me():ConCommand("aowl giveammo") end
		end)
		CommandPress:SetData("chatCmdAutoAmmo", "true")
	else
		CommandPress:Print("Automatic ammo giving disabled!")
		hook.Remove("Think", "autoAmmoTimer")
		CommandPress:SetData("chatCmdAutoAmmo", "false")
	end
end)

Setup()

hook.Add("CommandPressCleanUp", "CleanAutoAmmo", function()
  Setup()
end)
