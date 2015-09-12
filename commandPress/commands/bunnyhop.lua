local function Setup()
  CommandPress:SetData("cmdPressBunnyHop", "false")
  hook.Remove("Think", "cmdPressBunnyHopHook")
  timer.Remove("cmdPressBunnyhopTimer")
end

CommandPress:Add("bhop", function(text, ply)
  if (ply ~= CommandPress:Me()) then return end

  if (CommandPress:SetData("cmdPressBunnyHop", "false") == false) then
    hook.Add("Think", "cmdPressBunnyHopHook", function()
      if input.IsKeyDown(KEY_SPACE) then
        if ply:IsOnGround() then
          ply:ConCommand("+jump")
          timer.Create("cmdPressBunnyhopTimer", 0, 0.01, function()
            ply:ConCommand("-jump")
          end)
        end
      end
    end)
  else
    Setup()
  end
end)

Setup()

hook.Add("CommandPressCleanUp", "CleanBunnyHop", function()
  Setup()
end)
