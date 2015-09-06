CommandPress:Add("eyes", function(text)
	local ent = CommandPress:Me():GetEyeTrace().Entity;

	local owner = nil;

	if (ent:CPPIGetOwner()) then
		owner = ent:CPPIGetOwner()
	else
		owner = ent:GetOwner()
	end

  local args = CommandPress:SplitText(text)

  local aloud = false

  if (args[2] != nil) then
    if (string.lower(args[2]) == "aloud") then
      aloud = true
    end
  end

  local invaldEntString = "That's not a valid entity!";

  if aloud then

    Say("I see...")

    local entityInfo = ""

    if ent:IsPlayer() then
      entityInfo = entityInfo .. " | Name: " .. targ:Nick() .. " | "
      entityInfo = entityInfo .. " | Health: " .. targ:Health() .. " | "
      entityInfo = entityInfo .. " | Armor: " .. targ:Armor() .. " | "
      entityInfo = entityInfo .. " | Alive: " .. CommandPress:BoolToEnglish(targ:Alive()) .. " | "
      entityInfo = entityInfo .. " | Admin: " .. CommandPress:BoolToEnglish(CommandPress:IsAdmin(targ)) .. " | "
      entityInfo = entityInfo .. " | SteamID: " .. ttarg:SteamID() .. " / " .. targ:SteamID64() .. " | "
      Say(entityInfo)
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

    Say(entityInfo)
  else
    CommandPress:Print("I see...")

    if ent:IsPlayer() then
      CommandPress:Print("Name: " .. ent:Nick())
      CommandPress:Print("Health: " .. ent:Health())
      CommandPress:Print("Armor: " .. ent:Armor())
      CommandPress:Print("Alive: " .. CommandPress:BoolToEnglish(ent:Alive()))
      CommandPress:Print("Admin: " .. CommandPress:BoolToEnglish(CommandPress:IsAdmin(ent)))
      CommandPress:Print("SteamID: " .. ent:SteamID() .. " | " .. ent:SteamID64())
      return
    end

    if (ent:IsWorld()) then
      CommandPress:Print("Model: World (" .. ent:GetModel() .. ")")
    else
      CommandPress:Print("Model: " .. ent:GetModel())
    end

    if IsValid(owner) then
      CommandPress:Print("Owner: " .. owner:Nick() .. " / " .. owner:SteamID())
    else
      CommandPress:Print("Owner: " .. GetHostName())
    end
  end
end)
