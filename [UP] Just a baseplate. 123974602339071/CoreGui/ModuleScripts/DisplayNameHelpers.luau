-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.DefaultChatModules.Utility.DisplayNameHelpers
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v_u_3 = require(v2:WaitForChild("ChatSettings"))
local v_u_4 = {
	["ChattingToSelf"] = 1,
	["NoMatches"] = 2,
	["MultipleMatches"] = 3
}
return {
	["CommandErrorCodes"] = v_u_4,
	["getUserNameFromChattedName"] = function(p5, p6, p7) -- name: getUserNameFromChattedName
		-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3
		if p6 == p5 then
			return p6, v_u_4.ChattingToSelf
		else
			local v8 = v_u_1:GetPlayers()
			for _, v9 in pairs(v8) do
				if string.lower(v9.Name) ~= string.lower(p5) then
					continue
				end
				return v9.Name, nil
			end
			local v10 = 0
			local v11 = nil
			if v_u_3.PlayerDisplayNamesEnabled then
				for _, v12 in pairs(v8) do
					if v12.Name == p6 or string.lower(v12.DisplayName) ~= string.lower(p5) then
						continue
					end
					v10 = v10 + 1
					v11 = v12.Name
				end
			end
			if v10 == 1 then
				return v11, nil
			elseif v10 == 0 then
				if p7 == p5 then
					return p7, v_u_4.ChattingToSelf
				else
					return p5, v_u_4.NoMatches
				end
			else
				if v10 >= 2 then
					return p5, v_u_4.MultipleMatches
				end
				return
			end
		end
	end,
	["getUsersWithDisplayNameString"] = function(p13, p14) -- name: getUsersWithDisplayNameString
		-- upvalues: (copy) v_u_1
		local v15 = v_u_1:GetPlayers()
		local v16 = {}
		local v17 = ""
		for _, v18 in pairs(v15) do
			if v18.Name == p14 or string.lower(v18.DisplayName) ~= string.lower(p13) then
				continue
			end
			local v19 = v18.Name
			table.insert(v16, v19)
		end
		for v20, v21 in pairs(v16) do
			if v20 == #v16 then
				v17 = v17 .. "@" .. v21
			else
				v17 = v17 .. "@" .. v21 .. ", "
			end
		end
		return v17
	end
}