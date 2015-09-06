CommandPress:Add("info", function(text)

  local args = CommandPress:SplitText(text)

  local PrintFunc
  local aloud = false

  if (string.lower(args[2]) == "aloud") then
    PrintFunc = function(text) CommandPress:Say(text) end
    aloud = true
  else
    PrintFunc = function(text) CommandPress:Print(text) end
  end

	PrintFunc("CommandPress by Preston - Version " .. CommandPress.Version)
	PrintFunc("Currently loaded commands: ")
  if (aloud) then
    local commandList = ""
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
    PrintFunc(commandList)
  else
    for k,v in pairs(CommandPress.Commands) do
      PrintFunc(v[1])
    end
  end
end)
