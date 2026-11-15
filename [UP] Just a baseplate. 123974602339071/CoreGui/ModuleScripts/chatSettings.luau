-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Reducers.chatSettings
local v1 = game:GetService("CorePackages")
require(v1.Packages.Cryo)
local v2 = require(v1.Packages.Rodux)
local v3 = require(script.Parent.Parent.Actions.UpdateChatSettings)
local v_u_4 = require(script.Parent.Parent.ChatSettings)
local function v_u_9(p5) -- name: deepCopy
	-- upvalues: (copy) v_u_9
	if type(p5) ~= "table" then
		return p5
	end
	local v6 = {}
	for v7, v8 in pairs(p5) do
		v6[v7] = v_u_9(v8)
	end
	return v6
end
local function v_u_14(p10, p11) -- name: mergeInto
	-- upvalues: (copy) v_u_14
	for v12, v13 in pairs(p11) do
		if type(v13) == "table" then
			if not p10[v12] then
				continue
			end
			v_u_14(p10[v12], v13)
		else
			p10[v12] = v13
		end
	end
end
return v2.createReducer(v_u_4, {
	[v3.name] = function(_, p15)
		-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_14
		local v16 = v_u_9(v_u_4)
		v_u_14(v16, p15.settings)
		local v17 = p15.settings.UserSpecificSettings
		if v17 then
			for v18, v19 in pairs(v17) do
				local v20 = v_u_9(v_u_4)
				v20.UserSpecificSettings = nil
				v_u_14(v20, v19)
				v16.UserSpecificSettings[v18] = v20
			end
		end
		return v16
	end
})