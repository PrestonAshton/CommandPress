

me:SetPData("chatCmdWallHax",  "false")
me:SetPData("chatCmdAutoAmmo", "false")
me:SetPData("chatCmdAutoRevive", "false")

timer.Remove("annoyTimer")
hook.Remove("Think", "autoAmmoTimer")
hook.Remove("Think", "autoReviveTimer")
hook.Remove("PreDrawHalos", "chatCmdWallHaxHook")

addCommand("anhero", function(ply, text)
	if ply:GetPData("chatCmdAnHero", "false") == "false" then
		prnt("You are an hero")
		timer.Create("anHeroTimer", 0.5, 0, function()
			me:ConCommand("aowl suicide")
		end)
		ply:SetPData("chatCmdAnHero", "true")
	else
		prnt("You are no longer an hero")
		timer.Remove("anHeroTimer")
		ply:SetPData("chatCmdAnHero", "false")
	end
end)

addCommand("autoammo", function(ply, text)
	if ply:GetPData("chatCmdAutoAmmo", "false") == "false" then
		prnt("Automatic ammo giving enabled!")
		hook.Add("Think", "autoAmmoTimer", function()
			local wep = ply:GetActiveWeapon()
			if (!IsValid(wep)) then return end

			if (ply:GetAmmoCount(wep:GetPrimaryAmmoType()) < 9999) then
				ply:ConCommand("aowl giveammo") end
		end)
		ply:SetPData("chatCmdAutoAmmo", true)
	else
		prnt("Automatic ammo giving disabled!")
		hook.Remove("Tick", "autoAmmoTimer")
		ply:SetPData("chatCmdAutoAmmo", false)
	end
end)

addCommand("autorevive", function(ply, text)
	if ply:GetPData("chatCmdAutoRevive", "false") == "false" then
		ply:PrintMessage(HUD_PRINTTALK, "Automatic revive enabled!")
		hook.Add("Think", "autoReviveTimer", function()
			if (!ply:Alive()) then
				ply:ConCommand("aowl revive") end
		end)
		ply:SetPData("chatCmdAutoRevive", true)
	else
		ply:PrintMessage(HUD_PRINTTALK, "Automatic revive disabled!")
		hook.Remove("Tick", "autoReviveTimer")
		ply:SetPData("chatCmdAutoRevive", false)
	end
end)

addCommand("wallhax", function(ply, text)
	if ply:GetPData("chatCmdWallHax", "false") == "false" then
		me:PrintMessage(HUD_PRINTTALK, "Über Hax enabled!")
		hook.Add( "PreDrawHalos", "chatCmdWallHaxHook", function()
			halo.Add( player.GetAll(), Color( 255, 0, 0 ), 0, 0, 2, true, true )
		end )
		ply:SetPData("chatCmdWallHax", "true")
	else
		me:PrintMessage(HUD_PRINTTALK, "Über Hax disabled!")
		hook.Remove("PreDrawHalos", "chatCmdWallHaxHook")
		ply:SetPData("chatCmdWallHax", "false")
	end
end)

addCommand("info", function(ply, text)
	prnt("CommandPress by Preston - Version " .. version)
	prnt("Currently loaded commands: ")
	for k,v in pairs(commands) do
		prnt(v[1])
	end
end)

addCommand("infoaloud", function(ply, text)
	Say("CommandPress by Preston - Version " .. version)
	Say("Currently loaded commands: ")
	for k,v in pairs(commands) do
		Say(v[1])
	end
end)

addCommand("playerinfo", function(ply, text)
	local targ = resolveName(string.sub(text, 13))

	if IsValid(targ) then
		prnt("Player info for " .. targ:Name() .. ":")
		prnt("Name: " .. targ:Nick())
		prnt("Health: " .. targ:Health())
		prnt("Armor: " .. targ:Armor())
		prnt("Alive: " .. boolToYN(targ:Alive()))
		prnt("Admin: " .. boolToYN(isAnyAdmin(targ)))
		prnt("SteamID: " .. targ:SteamID() .. " | " .. targ:SteamID64())
	end
end)


addCommand("playerinfoaloud", function(ply, text)
	local targ = resolveName(string.sub(text, 18))

	if IsValid(targ) then
		Say("Player info for " .. targ:Name() .. ":")
		Say("Name: " .. targ:Nick())
		Say("Health: " .. targ:Health())
		Say("Armor: " .. targ:Armor())
		Say("Alive: " .. boolToYN(targ:Alive()))
		Say("Admin: " .. boolToYN(isAnyAdmin(targ)))
		Say("SteamID: " .. targ:SteamID() .. " | " .. targ:SteamID64())
	end
end)

addCommand("eyesaloud", function(ply, text)
	local ent = ply:GetEyeTrace().Entity;
	local owner = ent:CPPIGetOwner()

	if not IsValid(ent) then
		Say("That's not a valid entity!") return end

 	Say("I see...")

 	if (ent:IsWorld()) then
 		Say("Model: World (" .. ent:GetModel() .. ")")
 	else
	 	Say("Model: " .. ent:GetModel())
 	end

 	if IsValid(owner) then
 		Say("Owner: " .. owner:Nick() .. " / " .. owner:SteamID())
 	else
 		Say("Owner: " .. GetHostName())
 	end

 	if ent:IsPlayer() then
 		Say("Name: " .. ent:Nick())
 		Say("SteamID: " .. ent:SteamID() .. " | " .. ent:SteamID64())
 	end
end)

addCommand("eyes", function(ply, text)
	local ent = ply:GetEyeTrace().Entity;
	local owner = ent:CPPIGetOwner()

	if not IsValid(ent) then
		prnt(ply, "That's not a valid entity!") return end

 	prnt(ply, "I see...")

 	if (ent:IsWorld()) then
 		prnt(ply, "Model: World (" .. ent:GetModel() .. ")")
 	else
	 	prnt(ply, "Model: " .. ent:GetModel())
 	end

 	if IsValid(owner) then
 		prnt(ply, "Owner: " .. owner:Nick() .. " / " .. owner:SteamID())
 	else
 		prnt(ply, "Owner: " .. GetHostName())
 	end

 	if ent:IsPlayer() then
 		prnt(ply, "Name: " .. ent:Nick())
 		prnt(ply, "SteamID: " .. ent:SteamID() .. " | " .. ent:SteamID64())
 	end
end)
