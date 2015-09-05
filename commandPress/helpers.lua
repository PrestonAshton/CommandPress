function CommandPress:resolveName(name)
	 return easylua.FindEntity(name)
end

function CommandPress:newLine()
	return "\n"
end

function CommandPress:me()
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

function CommandPress:print(text)
	me:PrintMessage(HUD_PRINTTALK, text)
end

nextIndex = 1

function CommandPress:add(identifier, callback)
	commands[identifier] = {identifier, callback}
	concommand.Add("cmdPress_" .. identifier, function(ply, _, __, args)
		local text = "!" .. identifier .. " " .. args;
		commands[identifier][2](ply, text)
	end)
end
