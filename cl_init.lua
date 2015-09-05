function CommandPressSetup()

  CommandPress = { Commands = {}, Helpers = {}, Version = 0.4, BaseURL = "https://www.prestonashtons.work/CommandPress/commandPress/" }

  me:PrintMessage(HUD_PRINTTALK, "Initialising CommandPress by Preston - Version " .. CommandPress.Version)

  http.Fetch(CommandPress.BaseURL .. "default.manifest", function(body, len, headers, code)
  	local lines = string.Explode("\n", body, false)
  	for i = 1,#lines do
  	  http.Fetch(CommandPress.BaseURL .. lines[i],
  		    function(body, len, headers, code)
  			    RunStringEx(body, "CommandPress - " .. lines[i])
  	     end,
  		   function (error)
  		     Say(error)
        end)
  	end
  end,
  function(error)
  	Say(error)
  end)

end

CommandPressSetup()
