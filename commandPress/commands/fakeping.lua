local function Setup()
  CommandPress:SetData("chatCmdFakePing", "false")
    CommandPress:SetData("chatCmdFakePingOriginalRate", GetConVar("cl_cmdrate"))
end

Setup()

CommandPress:Add("fakeping", function(text, ply)

  if (ply ~= CommandPress:Me()) then return end

	if CommandPress:GetData("chatCmdFakePing", "false") == "false" then
		ply:ConCommand("cl_cmdrate +100")
    CommandPress:SetData("chatCmdFakePing", "true")
	else
		ply:ConCommand("cl_cmdrate " .. CommandPress:GetData("chatCmdFakePingOriginalRate", "66.7"))
    CommandPress:SetData("chatCmdFakePing", "false")
	end
end)

hook.Add("CommandPressCleanUp", "CleanFakePing", function()
  Setup()
end)
