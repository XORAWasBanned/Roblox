-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Reducer.PromptInfo
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent
local v_u_5 = require(v4.PromptType)
local v6 = require(v4.Actions.CloseOpenPrompt)
local v7 = require(v4.Actions.OpenPrompt)
local v8 = require(v4.Actions.CreateOutfitConfirmed)
return v2.createReducer({
	["promptType"] = nil,
	["humanoidDescription"] = nil,
	["rigType"] = nil,
	["itemId"] = nil,
	["itemType"] = nil,
	["itemName"] = nil,
	["isFavorited"] = nil,
	["queue"] = nil,
	["infoQueue"] = nil,
	["queue"] = {},
	["infoQueue"] = {}
}, {
	[v6.name] = function(p9, _)
		-- upvalues: (copy) v_u_3
		return v_u_3.isEmpty(p9.queue) and {
			["queue"] = p9.queue,
			["infoQueue"] = p9.infoQueue
		} or v_u_3.Dictionary.join(p9.infoQueue[1], {
			["promptType"] = p9.queue[1],
			["queue"] = v_u_3.List.removeIndex(p9.queue, 1),
			["infoQueue"] = v_u_3.List.removeIndex(p9.infoQueue, 1)
		})
	end,
	[v7.name] = function(p10, p11)
		-- upvalues: (copy) v_u_3
		if p10.promptType == nil then
			return v_u_3.Dictionary.join(p10, {
				["promptType"] = p11.promptType
			}, p11.promptInfo)
		else
			return v_u_3.Dictionary.join(p10, {
				["queue"] = v_u_3.List.join(p10.queue, { p11.promptType }),
				["infoQueue"] = v_u_3.List.join(p10.infoQueue, { p11.promptInfo })
			})
		end
	end,
	[v8.name] = function(p12, _)
		-- upvalues: (copy) v_u_3, (copy) v_u_5
		return v_u_3.Dictionary.join(p12, {
			["promptType"] = v_u_5.EnterOutfitName
		})
	end
})