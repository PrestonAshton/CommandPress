local function Setup()
  CommandPress:SetData("chatCmdWallHax",  "false")
  hook.Remove("PreDrawHalos", "chatCmdWallHaxHook")
end

CommandPress:Add("wallhax", function(ply, text)
	if CommandPress:GetData("chatCmdWallHax", "false") == "false" then
		CommandPress:Print(HUD_PRINTTALK, "Über Hax enabled!")
		hook.Add( "PreDrawHalos", "chatCmdWallHaxHook", function()
			halo.Add( player.GetAll(), Color( 255, 0, 0 ), 0, 0, 2, true, true )
		end )
		CommandPress:SetData("chatCmdWallHax", "true")
	else
		CommandPress:Print(HUD_PRINTTALK, "Über Hax disabled!")
		hook.Remove("PreDrawHalos", "chatCmdWallHaxHook")
		CommandPress:SetData("chatCmdWallHax", "false")
	end
end)

Setup()

hook.Add("CommandPressCleanUp", "CleanWallhax", function()
  Setup()
end)
