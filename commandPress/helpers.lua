function CommandPress:ResolveName(name)
	 return easylua.FindEntity(name)
end

function CommandPress:newLine()
	return "\n"
end

function CommandPress:Me()
	if (CommandPress.Implementation.Me == nil) then
		CommandPress.Implementation.Me = LocalPlayer()
	end

	return CommandPress.Implementation.Me
end

function CommandPress:BoolToEnglish(toconvert)
	if (toconvert == false) then
		return "No" end

	return "Yes"
end

function CommandPress:SplitText(text)
	local args = {}
	for word in text:gmatch("%w+") do
		table.insert(args, word)
	end

	return args
end

function CommandPress:IsAdmin(ply)
	if (ply:IsAdmin()) then
		return true end

	return false
end

function CommandPress:Print(text)
	CommandPress:Me():PrintMessage(HUD_PRINTTALK, text)
end

function CommandPress:GetData(key, defualt)
	return CommandPress:Me():GetPData(key, default)
end

function CommandPress:SetData(key, value, ply)
	CommandPress:Me():SetPData(key, value)
end

function CommandPress:Remove(identifier)
	CommandPress.Commands[identifier] = nil
	concommand.Remove("cmdPress_" .. identifier)
end


function CommandPress:Add(identifier, callback)
	CommandPress.Commands[identifier] = {identifier, callback}
	concommand.Add("cmdPress_" .. identifier, function(ply, _, __, args)
		local text = "!" .. identifier .. " " .. args;
		CommandPress.Commands[identifier][2](text)
	end)
end

function CommandPress:Update()
	for _,v in pairs(CommandPress.Commands) do
		CommandPress:Remove(v.identifier)
	end

	hook.Call("CommandPressCleanUp")
	CommandPressSetup()
end
