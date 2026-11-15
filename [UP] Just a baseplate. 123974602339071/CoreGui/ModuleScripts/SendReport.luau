-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Thunks.SendReport
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Actions.OpenReportSentDialog)
return function(p_u_5, p_u_6, p_u_7)
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_2
	return function(p_u_8)
		-- upvalues: (copy) p_u_7, (ref) v_u_1, (copy) p_u_5, (copy) p_u_6, (ref) v_u_4, (ref) v_u_2
		if p_u_7 == nil then
			local v9 = p_u_8:getState()
			local v10 = v9.gameInfo.name
			local v11 = v9.gameInfo.description
			if v10 ~= "" then
				local v12 = string.format
				local v13 = p_u_6
				local v14 = game.PlaceId
				local v_u_15 = v12("User Report: \n    %s \nPlace Title: \n    %s \nPlaceId: \n    %s \nPlace Description: \n    %s \n", v13, v10, tostring(v14), v11)
				coroutine.wrap(function()
					-- upvalues: (ref) v_u_2, (ref) v_u_1, (ref) p_u_5, (copy) v_u_15, (copy) p_u_8, (ref) v_u_4
					if not v_u_2:IsStudio() then
						v_u_1:ReportAbuse(nil, p_u_5, v_u_15)
					end
					p_u_8:dispatch(v_u_4())
				end)()
			end
		else
			local v_u_16 = v_u_1:GetPlayerByUserId(p_u_7)
			if v_u_16 then
				coroutine.wrap(function()
					-- upvalues: (ref) v_u_1, (copy) v_u_16, (ref) p_u_5, (ref) p_u_6, (copy) p_u_8, (ref) v_u_4
					v_u_1:ReportAbuse(v_u_16, p_u_5, p_u_6)
					p_u_8:dispatch(v_u_4())
				end)()
				return
			end
		end
	end
end