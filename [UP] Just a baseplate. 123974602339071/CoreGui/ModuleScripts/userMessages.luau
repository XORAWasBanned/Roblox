-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Reducers.userMessages
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.Cryo)
local v4 = require(v1.Packages.Rodux)
local v5 = require(script.Parent.Parent.Actions.AddMessage)
local v6 = require(script.Parent.Parent.Actions.RemoveMessage)
local v7 = require(v2.Modules.VoiceChat.Actions.PlayerRemoved)
return v4.createReducer({}, {
	[v5.name] = function(p8, p9)
		-- upvalues: (copy) v_u_3
		local v10 = p8[p9.message.userId] or {}
		return v_u_3.Dictionary.join(p8, {
			[p9.message.userId] = v_u_3.List.join(v10, { p9.message.id })
		})
	end,
	[v6.name] = function(p11, p_u_12)
		-- upvalues: (copy) v_u_3
		local v13 = p11[p_u_12.message.userId]
		if v13 then
			if #v13 == 1 and v13[1] == p_u_12.message.id then
				return v_u_3.Dictionary.join(p11, {
					[p_u_12.message.userId] = v_u_3.None
				})
			else
				return v_u_3.Dictionary.join(p11, {
					[p_u_12.message.userId] = v_u_3.List.filter(v13, function(p14)
						-- upvalues: (copy) p_u_12
						return p14 ~= p_u_12.message.id
					end)
				})
			end
		else
			return p11
		end
	end,
	[v7.name] = function(p15, p16)
		-- upvalues: (copy) v_u_3
		if p15[p16.userId] then
			return v_u_3.Dictionary.join(p15, {
				[p16.userId] = v_u_3.None
			})
		else
			return p15
		end
	end
})