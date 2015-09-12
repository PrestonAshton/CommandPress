local function Setup()
  hook.Remove("Think", "cmdPressBunnyHopHook")
  timer.Remove("cmdPressBunnyhopTimer")
  CommandPress:SetData("cmdPressBunnyHop", "false")
end

CommandPress:Add("bhop", function(text, ply)
  if (ply ~= CommandPress:Me()) then return end

  if (CommandPress:GetData("cmdPressBunnyHop", "false") == "false") then
    hook.Add("Think", "cmdPressBunnyHopHook", function()
      if input.IsKeyDown(KEY_SPACE) then
          ply:ConCommand("+jump")
          timer.Create("cmdPressBunnyhopTimer", 0, 0.01, function()
            ply:ConCommand("-jump")
          end)
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
