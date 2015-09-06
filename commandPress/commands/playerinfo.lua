CommandPress:Add("playerinfo", function(text)

  local args = CommandPress:SplitText(text)

  local PrintFunc
  local aloud = false

  if (args[3] != nil) then
    if (string.lower(args[3]) == "aloud") then
      aloud = true
    end
  end

  local targ = CommandPress:ResolveName(args[2])

  local playerInfoIntro = "Player info for " .. targ:Name() .. ":"

  if (IsValid(targ)) then
    if (aloud) then
      CommandPress:Say(playerInfoIntro)
      local playerInfo = ""
      playerInfo = playerInfo .. " | Name: " .. targ:Nick() .. " | "
      playerInfo = playerInfo .. " | Health: " .. targ:Health() .. " | "
      playerInfo = playerInfo .. " | Armor: " .. targ:Armor() .. " | "
      playerInfo = playerInfo .. " | Alive: " .. CommandPress:BoolToEnglish(targ:Alive()) .. " | "
      playerInfo = playerInfo .. " | Admin: " .. CommandPress:BoolToEnglish(CommandPress:IsAdmin(targ)) .. " | "
      playerInfo = playerInfo .. " | Model: " .. targ:GetModel() .. " | "
      playerInfo = playerInfo .. " | SteamID: " .. targ:SteamID() .. " / " .. targ:SteamID64() .. " | "

      CommandPress:Say(playerInfo)
    else
      CommandPress:Print(playerInfoIntro)
      CommandPress:Print("Name: " .. targ:Nick())
      CommandPress:Print("Health: " .. targ:Health())
      CommandPress:Print("Armor: " .. targ:Armor())
      CommandPress:Print("Alive: " .. CommandPress:BoolToEnglish(targ:Alive()))
      CommandPress:Print("Admin: " .. CommandPress:BoolToEnglish(CommandPress:IsAdmin(targ)))
      CommandPress:Print("Model: " .. targ:GetModel())
      CommandPress:Print("SteamID: " .. targ:SteamID() .. " | " .. targ:SteamID64())
    end
  end
end)
