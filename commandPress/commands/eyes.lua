addCommand("eyes", function(ply, text)
	local ent = ply:GetEyeTrace().Entity;
	local owner = ent:CPPIGetOwner()

  local args = CommandPress:SplitText(text)

  local aloud = false

  if (string.lower(args[2]) == "aloud") then
    aloud = true
  end

  local invaldEntString = "That's not a valid entity!";

  if aloud then
    if not IsValid(ent) then
      Say(invaldEntString)
    end

    Say("I see...")

    local entityInfo = ""

    if ent:IsPlayer() then
      entityInfo = entityInfo .. " | Name: " .. targ:Nick() .. " | "
      entityInfo = entityInfo .. " | Health: " .. targ:Health() .. " | "
      entityInfo = entityInfo .. " | Armor: " .. targ:Armor() .. " | "
      entityInfo = entityInfo .. " | Alive: " .. CommandPress:BoolToEnglish(targ:Alive()) .. " | "
      entityInfo = entityInfo .. " | Admin: " .. CommandPress:BoolToEnglish(CommandPress:IsAdmin(targ)) .. " | "
      entityInfo = entityInfo .. " | SteamID: " .. ttarg:SteamID() .. " / " .. targ:SteamID64() .. " | "
      return
    end

    if (ent:IsWorld()) then
      entityInfo = entityInfo .. " | Model: World (" .. ent:GetModel() .. ") | "
    else
      entityInfo = entityInfo .. " | Model: " .. ent:GetModel() .. " | "
    end

    if IsValid(owner) then
      entityInfo = entityInfo .. " | Owner: " .. owner:Nick() .. " / " .. owner:SteamID() .. " | "
    else
      entityInfo = entityInfo .. " | Owner: " .. GetHostName() .. " | "
    end
  else
    if not IsValid(ent) then
      CommandPress:Print(invaldEntString)
    end
    CommandPress:Print("I see...")

    if ent:IsPlayer() then
      CommandPress:Print(playerInfoIntro)
      CommandPress:Print("Name: " .. targ:Nick())
      CommandPress:Print("Health: " .. targ:Health())
      CommandPress:Print("Armor: " .. targ:Armor())
      CommandPress:Print("Alive: " .. CommandPress:BoolToEnglish(targ:Alive()))
      CommandPress:Print("Admin: " .. CommandPress:BoolToEnglish(CommandPress:IsAdmin(targ)))
      CommandPress:Print("SteamID: " .. targ:SteamID() .. " | " .. targ:SteamID64())
      return
    end

    if (ent:IsWorld()) then
      CommandPress:Print("Model: World (" .. ent:GetModel() .. ")")
    else
      CommandPress:Print("Model: " .. ent:GetModel())
    end

    if IsValid(owner) then
      CommandPress:Print("Owner: " .. owner:Nick() .. " / " .. owner:SteamID()
    else
      CommandPress:Print("Owner: " .. GetHostName()
    end
  end
end)
