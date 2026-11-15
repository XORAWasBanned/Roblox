-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Reducers.messages
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = require(script.Parent.Parent.Actions.AddMessage)
local v5 = require(script.Parent.Parent.Actions.RemoveMessage)
local v6 = require(script.Parent.Parent.Actions.SetMessageText)
return v3.createReducer({}, {
	[v4.name] = function(p7, p8)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p7, {
			[p8.message.id] = p8.message
		})
	end,
	[v5.name] = function(p9, p10)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p9, {
			[p10.message.id] = v_u_2.None
		})
	end,
	[v6.name] = function(p11, p12)
		-- upvalues: (copy) v_u_2
		local v13 = p11[p12.messageId]
		if not v13 then
			return p11
		end
		local v14 = v_u_2.Dictionary.join
		local v15 = {
			[p12.messageId] = v_u_2.Dictionary.join(v13, {
				["text"] = p12.newText
			})
		}
		return v14(p11, v15)
	end
})