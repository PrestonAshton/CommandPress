function CommandPress:ResolveName(name)
	hook.Call("CommandPressResolveName")
	 if not name then return nil end

	 local players = player.GetAll()

	 for k, v in pairs(players) do
		 if (tonumber(name) == v:UserID()) then
			 return v
		 end
	 end

	 for k, v in pairs(players) do
		 if (string.find(string.lower(v:Nick()), string.lower(tostring(name))) ~= nil) then
			 return v
		 end
	 end
end

function CommandPress:newLine()
	hook.Call("CommandPressNewLine")
	return "\n"
end

function CommandPress:Me()
	hook.Call("CommandPressMe")
	if (CommandPress.Implementation.Me == nil) then
		CommandPress.Implementation.Me = LocalPlayer()
	end

	return CommandPress.Implementation.Me
end

function CommandPress:BoolToEnglish(toconvert)
	hook.Call("CommandPressBoolToEnglish")
	if (toconvert == false) then
		return "No" end

	return "Yes"
end

function CommandPress:SplitText(text)
	hook.Call("CommandPressSplitText")
	local args = {}
	for word in text:gmatch("%w+") do
		table.insert(args, word)
	end

	return args
end

function CommandPress:IsAdmin(ply)
	hook.Call("CommandPressIsAdmin")
	if (ply:IsAdmin()) then
		return true end

	return false
end

function CommandPress:CheckForUpdate()
	http.Fetch("https://api.github.com/repos/PrestonAshton/CommandPress/commits",
	function(body, len, headers, code)
		local commits = util.JSONToTable(body)
		local latestCommitHash = commits[1]["sha"]
		if latestCommitHash ~= CommandPress.Implementation.LastUpdateHash then
			CommandPress:Print("New update found!")
			CommandPress:Print("Update commit log: " .. commits[1]["commit"]["message"])
			CommandPress:Print("Downloading update and running...")
			CommandPress:Update()
		end
	end,
	function(error)	end)
end

function CommandPress:Print(text)
	CommandPress:Me():PrintMessage(HUD_PRINTTALK, text)
	hook.Call("CommandPressPrint")
end

function CommandPress:GetData(key, defualt)
	hook.Call("CommandPressGetData")
	return CommandPress:Me():GetPData(key, default)
end

function CommandPress:SetData(key, value, ply)
	hook.Call("CommandPressSetData")
	CommandPress:Me():SetPData(key, value)
end
function CommandPress:Remove(identifier)
	hook.Call("CommandPressCommandRemove")
	CommandPress.Commands[identifier] = nil
	concommand.Remove("cmdPress_" .. identifier)
end

function CommandPress:Say(text)
	if (text == nil) then return end

	local me = CommandPress:Me();

	timer.Simple(0, function() me:ConCommand("say " .. text) end)
end

function CommandPress:Add(identifier, callback)
	hook.Call("CommandPressAdd")
	CommandPress.Commands[identifier] = {identifier, callback}
	concommand.Add("cmdPress_" .. identifier, function(ply, _, __, args)
		local text = "!" .. identifier .. " " .. args;
		CommandPress.Commands[identifier][2](text, CommandPress:Me())
	end)
end

function CommandPress:Cleanup()
	hook.Call("CommandPressCleanUp")
end

function CommandPress:Update()
	hook.Call("CommandPressUpdate")

	table.foreach(CommandPress.Commands, function(k, v)
		CommandPress:Remove(k)
	end)

	CommandPress:Cleanup()
	CommandPressSetup()
end
