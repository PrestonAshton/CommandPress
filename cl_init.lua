function CommandPressSetup()

  CommandPress = {
    Commands = {},
    Helpers = {}, Version = 0.4,
    BaseURL = "https://raw.githubusercontent.com/PrestonAshton/CommandPress/master/commandPress/",
    Implementation = {
      Me = nil
    },
  }

  local me = LocalPlayer()

  me:PrintMessage(HUD_PRINTTALK, "Initialising CommandPress by Preston - Version " .. CommandPress.Version)

  http.Fetch(CommandPress.BaseURL .. "default.manifest", function(body, len, headers, code)
  	local lines = string.Explode("\n", body, false)
  	for i = 1,#lines do
  	  if (lines[i] ~= "") then
  	  http.Fetch(CommandPress.BaseURL .. lines[i],
  		    function(body, len, headers, code)
  			    RunStringEx(body, "CommandPress - " .. CommandPress.BaseURL .. lines[i])
	            if (i == #lines - 1) then
	              me:PrintMessage(HUD_PRINTTALK, "CommandPress Initialised!")
	            end
  	     end,
  		   function (error)
  		     me:PrintMessage(HUD_PRINTTALK, error)
  		     return
        end)
       end
  	end
  end,
  function(error)
  	me:PrintMessage(HUD_PRINTTALK, error)
  	return
  end)

end

CommandPressSetup()
