local function Setup()
  hook.Remove("Think", "cmdPressBunnyHopHook")
  timer.Remove("cmdPressBunnyhopTimer")
  CommandPress:SetData("cmdPressBunnyHop", "false")
  RunConsoleCommand("-jump")
end

CommandPress:Add("bhop", function(text, ply)
  if (ply ~= CommandPress:Me()) then return end

  if (CommandPress:GetData("cmdPressBunnyHop", "false") == "false") then
    hook.Add("Think", "cmdPressBunnyHopHook", function()
      if input.IsKeyDown(KEY_SPACE) then
          RunConsoleCommand(((LocalPlayer():IsOnGround() or LocalPlayer():WaterLevel() > 0) and "+" or "-").."jump")
      end
    end)
    CommandPress:SetData("cmdPressBunnyHop", "true")
  else
    Setup()
  end
end)

Setup()

hook.Add("CommandPressCleanUp", "CleanBunnyHop", function()
  Setup()
end)
