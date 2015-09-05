
local function Setup()
  CommandPress:SetData("chatCmdAutoAmmo", "false")
  hook.Remove("Think", "autoAmmoTimer")
end

CommandPress:Add("autoammo", function(ply, text)
	if CommandPress:GetData("chatCmdAutoAmmo", "false") == "false" then
		CommandPress:Print("Automatic ammo giving enabled!")
		hook.Add("Think", "autoAmmoTimer", function()
			local wep = ply:GetActiveWeapon()
			if (!IsValid(wep)) then return end

			if (ply:GetAmmoCount(wep:GetPrimaryAmmoType()) < 9999) then
				ply:ConCommand("aowl giveammo") end
		end)
		CommandPress:SetData("chatCmdAutoAmmo", "true")
	else
		CommandPress:Print("Automatic ammo giving disabled!")
		hook.Remove("Tick", "autoAmmoTimer")
		CommandPress:SetData("chatCmdAutoAmmo", false)
	end
end)

hook.Add("CommandPressCleanUp", "CleanAutoAmmo", function()
  Setup()
end)
