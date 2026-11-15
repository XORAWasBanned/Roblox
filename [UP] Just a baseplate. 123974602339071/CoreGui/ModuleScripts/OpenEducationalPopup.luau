-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Thunks.OpenEducationalPopup
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Actions.OpenNativeClosePrompt)
return function(p_u_3, p_u_4, p_u_5)
	-- upvalues: (copy) v_u_2
	local v_u_6 = p_u_3:GetNotificationTypeList()
	return function(p7)
		-- upvalues: (copy) p_u_4, (copy) p_u_5, (copy) p_u_3, (copy) v_u_6, (ref) v_u_2
		local v8 = p7:getState().nativeClosePrompt.closingApp
		local v9 = p_u_4
		local v10 = tonumber(v9:GetItem("NativeCloseLuaPromptDisplayCount")) or 0
		if v8 or p_u_5 <= v10 then
			p_u_3:BroadcastNotification("", v_u_6.NATIVE_EXIT)
		else
			p7:dispatch(v_u_2())
			local v11 = v10 + 1
			p_u_4:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(v11)))
			p_u_4:flush()
		end
	end
end