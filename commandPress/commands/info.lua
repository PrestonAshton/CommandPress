CommandPress:Add("info", function(text)

  local args = CommandPress:SplitText(text)

  local PrintFunc

  if (args[2] == "aloud") then
    PrintFunc = function(text) Say(text) end
  else
    PrintFunc = function(text) CommandPress:Print(text) end
  end

	PrintFunc("CommandPress by Preston - Version " .. CommandPress.Version)
	PrintFunc("Currently loaded commands: ")
	for k,v in pairs(commands) do
		PrintFunc(v[1])
	end
end)
