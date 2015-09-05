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
