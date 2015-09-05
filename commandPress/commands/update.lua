CommandPress:Add("update", function(text)
	hook.Call("CommandPressCleanUp")
  CommandPressSetup()
end)
