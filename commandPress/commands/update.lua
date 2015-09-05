CommandPress:Add("update", function(ply, text)
	hook.Call("CommandPressCleanUp")
  CommandPressSetup()
end)
