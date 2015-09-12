local function Setup()
  CommandPress:SetData("chatCmdAutoRevive", "false")
  hook.Remove("Think", "autoReviveTimer")
end

local function revive(conCmdName)
  local me = CommandPress:Me()
  hook.Add("Think", "autoReviveTimer", function()
    if (not me:Alive()) then
      me:ConCommand(conCmdName) end
  end)
  CommandPress:SetData("chatCmdAutoRevive", true)
  CommandPress:Print("Automatic revive enabled!")
end

CommandPress:Add("autorevive", function(text, ply)

  if (ply ~= CommandPress:Me()) then return end

	if CommandPress:GetData("chatCmdAutoRevive", "false") == "false" then
    if (aowl) then
      revive("aowl revive")
      return
    elseif (ulx) then
      if (ulx.revive) then
        revive("ulx revive")
      elseif (ulx.respawn) then
        revive("ulx respawn")
      elseif (ulx.spawn) then
        revive("ulx spawn")
      end
      return
    end

    CommandPress:Print("Automatic revive is not supported on this server!")
	else
    Setup()
		CommandPress:Print("Automatic revive disabled!")
	end
end)

Setup()

hook.Add("CommandPressCleanUp", "CleanAutoRevive", function()
  Setup()
end)
