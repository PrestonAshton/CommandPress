CommandPress = { Commands = {}, Helpers = {}, Version = 0.4, BaseURL = "https://raw.githubusercontent.com/PrestonAshton/CommandPress/master/commandPress/" }

me:PrintMessage(HUD_PRINTTALK, "Initialising CommandPress by Preston - Version " .. CommandPress.Version)

http.Fetch(CommandPress.BaseURL .. "default.manifest", function(body, len, headers, code)
	local lines = string.Explode("\n", body, false)
	for i = 1,#lines do

		http.Fetch(CommandPress.BaseURL .. lines[i],
			function(body, len, headers, code)
				if not body == "" then
					RunStringEx(body, "CommandPress - " .. lines[i]) end
			end,
			function (error)
				-- Error Handling
			end)
	end
end,
function(error)
	-- Error Handling
end)
