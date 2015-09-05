local function Setup()
  CommandPress:SetData("chatCmdAutoAmmo", "false")
  hook.Remove("Think", "autoAmmoTimer")
end

CommandPress:Add("autoammo", function(text)
	if CommandPress:GetData("chatCmdAutoAmmo", "false") == "false" then
		CommandPress:Print("Automatic ammo giving enabled!")
    local me = CommandPress:Me();
		hook.Add("Think", "autoAmmoTimer", function()
			local wep = me:GetActiveWeapon()
			if (!IsValid(me)) then return end

			if (me:GetAmmoCount(wep:GetPrimaryAmmoType()) < 9999) then
				me:ConCommand("aowl giveammo") end
		end)
		CommandPress:SetData("chatCmdAutoAmmo", "true")
	else
		CommandPress:Print("Automatic ammo giving disabled!")
		hook.Remove("Think", "autoAmmoTimer")
		CommandPress:SetData("chatCmdAutoAmmo", "false")
	end
end)

hook.Add("CommandPressCleanUp", "CleanAutoAmmo", function()
  Setup()
end)
