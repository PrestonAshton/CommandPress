local function Setup()
  hook.Remove("PreDrawHalos", "chatCmdWallHaxHook")
  CommandPress:SetData("chatCmdWallHax", "false")
end

local function addHalos(entityName)
  local haloColour = Color( 255, 0, 0 )
  if (entityName == nil) then
	  hook.Add( "PreDrawHalos", "chatCmdWallHaxHook", function()
	    halo.Add(ents.GetAll(), haloColour, 0, 0, 2, true, true )
	  end )
  else
  	hook.Add( "PreDrawHalos", "chatCmdWallHaxHook", function()
	    halo.Add(ents.FindByClass(entityName), haloColour, 0, 0, 2, true, true )
	  end )
  end

  CommandPress:Print("Über Hax enabled!")
  CommandPress:SetData("chatCmdWallHax", "true")
end

CommandPress:Add("wallhax", function(text, ply)

  if (ply ~= CommandPress:Me()) then return end

	if CommandPress:GetData("chatCmdWallHax", "false") == "false" then
      local args = CommandPress:SplitText(text)
      addHalos(args[2])
	else
    CommandPress:Print("Über Hax disabled!")
    Setup()
	end
end)

Setup()

hook.Add("CommandPressCleanUp", "CleanWallhax", function()
  Setup()
end)
