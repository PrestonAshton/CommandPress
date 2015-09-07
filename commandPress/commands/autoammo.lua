local function Setup()
  CommandPress:SetData("chatCmdAutoAmmo", "false")
  hook.Remove("Think", "autoAmmoTimer")
end

local function giveAmmo(concmdName, maxAmmo)
  hook.Add("Think", "autoAmmoTimer", function()
    local wep = CommandPress:Me():GetActiveWeapon()
    if (!IsValid(wep)) then return end

    if (CommandPress:Me():GetAmmoCount(wep:GetPrimaryAmmoType()) < maxAmmo) then
      CommandPress:Me():ConCommand(concmdName) end
  end)
	CommandPress:SetData("chatCmdAutoAmmo", "true")
  CommandPress:Print("Automatic ammo giving enabled!")
end

CommandPress:Add("autoammo", function(text, ply)

  if (ply ~= CommandPress:Me()) then return end

	if CommandPress:GetData("chatCmdAutoAmmo", "false") == "false" then
    if (aowl) then
      giveAmmo("aowl giveammo", 9999)
      return
    elseif (ulx) then
      if (ulx.ammo) then
        giveAmmo("ulx ammo", 254)
      elseif (ulx.giveammo) then
        giveAmmo("ulx giveammo", 254)
      elseif (ulx.infiniteammo) then
        giveAmmo("ulx infiniteammo", 254)
      end
      return
    end

    CommandPress:Print("Automatic ammo is not supported on this server!")
	else
    Setup()
		CommandPress:Print("Automatic ammo giving disabled!")
	end
end)

Setup()

hook.Add("CommandPressCleanUp", "CleanAutoAmmo", function()
  Setup()
end)
