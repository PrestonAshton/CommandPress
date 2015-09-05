function CommandPress:ResolveName(name)
	 return easylua.FindEntity(name)
end

function CommandPress:newLine()
	return "\n"
end

function CommandPress:Me()
	return LocalPlayer()
end

function CommandPress:boolToEnglish(toconvert)
	if (toconvert == false) then
		return "No" end

	return "Yes"
end

function CommandPress:isAdmin(ply)
	if (ply:IsAdmin() or ply:IsSuperAdmin()) then
		return true end

	return false
end

function CommandPress:Print(text)
	me:PrintMessage(HUD_PRINTTALK, text)
end

function CommandPress:GetData(key, defualt, ply)
	if not ply then
		ply = CommandPress:Me() end

	ply:GetPData(key, default)
end

function CommandPress:SetData(key, value, ply)
	if not ply then
		ply = CommandPress:Me() end

	ply:SetPData(key, value)
end

nextIndex = 1

function CommandPress:Add(identifier, callback)
	CommandPress.Commands[identifier] = {identifier, callback}
	concommand.Add("cmdPress_" .. identifier, function(ply, _, __, args)
		local text = "!" .. identifier .. " " .. args;
		CommandPress.Commands[identifier][2](ply, text)
	end)
end
