CommandPress:Add("info", function(text, ply)

  if (ply ~= CommandPress:Me()) then return end

  local args = CommandPress:SplitText(text)

  local aloud = false

  if (args[2] and string.lower(args[2]) == "aloud") then
    aloud = true
  else
    aloud = false
  end

  if (aloud) then
    local commandList = ""
    commandList = commandList .. "CommandPress by Preston - Version " .. CommandPress.Version .. " |"
    commandList = commandList .. "Current Commands: \n"
    local first = true
    for k,v in pairs(CommandPress.Commands) do
      if first then
        commandList = commandList .. v[1]
      else
        commandList = commandList .. ", " .. v[1]
      end
      first = false
    end
    commandList = commandList .. "."
    CommandPress:Say(commandList)
  else
    CommandPress:Print("CommandPress by Preston - Version " .. CommandPress.Version)
  	CommandPress:Print("Currently loaded commands: ")

    for k,v in pairs(CommandPress.Commands) do
      CommandPress:Print(v[1])
    end
  end
end)
