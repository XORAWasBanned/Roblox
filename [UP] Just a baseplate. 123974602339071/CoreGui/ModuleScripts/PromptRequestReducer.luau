-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Reducer.PromptRequestReducer
local v1 = script.Parent.Parent
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.Rodux)
local v_u_4 = require(v2.Packages.Cryo)
local v5 = require(v1.Actions.OpenPublishAssetPrompt)
local v6 = require(v1.Actions.OpenPublishAvatarPrompt)
local v7 = require(v1.Actions.OpenPublishAvatarAssetPrompt)
local v8 = require(v1.Actions.OpenPublishMakeupLookPrompt)
local v9 = require(v1.Actions.CloseOpenPrompt)
local v10 = require(v1.Actions.OpenResultModal)
local v11 = require(v1.Actions.CloseResultModal)
local v12 = require(v1.Actions.OpenValidationErrorModal)
local v13 = require(v1.Actions.SetHumanoidModel)
local v14 = require(v1.Actions.SetAccessoryInstance)
local v15 = require(v1.Actions.SetPriceInRobux)
local v16 = require(v1.Actions.SetPromptVisibility)
return v3.createReducer({
	["promptInfo"] = {},
	["queue"] = {}
}, {
	[v5.name] = function(p17, p18)
		-- upvalues: (copy) v_u_4
		if p17.promptInfo.promptType == nil then
			return v_u_4.Dictionary.join(p17, {
				["promptInfo"] = p18.promptInfo
			})
		else
			return v_u_4.Dictionary.join(p17, {
				["queue"] = v_u_4.List.join(p17.queue, { p18.promptInfo })
			})
		end
	end,
	[v6.name] = function(p19, p20)
		-- upvalues: (copy) v_u_4
		if p19.promptInfo.promptType == nil then
			return v_u_4.Dictionary.join(p19, {
				["promptInfo"] = p20.promptInfo
			})
		else
			return v_u_4.Dictionary.join(p19, {
				["queue"] = v_u_4.List.join(p19.queue, { p20.promptInfo })
			})
		end
	end,
	[v7.name] = function(p21, p22)
		-- upvalues: (copy) v_u_4
		if p21.promptInfo.promptType == nil then
			return v_u_4.Dictionary.join(p21, {
				["promptInfo"] = p22.promptInfo
			})
		else
			return v_u_4.Dictionary.join(p21, {
				["queue"] = v_u_4.List.join(p21.queue, { p22.promptInfo })
			})
		end
	end,
	[v8.name] = function(p23, p24)
		-- upvalues: (copy) v_u_4
		if p23.promptInfo.promptType == nil then
			return v_u_4.Dictionary.join(p23, {
				["promptInfo"] = p24.promptInfo
			})
		else
			return v_u_4.Dictionary.join(p23, {
				["queue"] = v_u_4.List.join(p23.queue, { p24.promptInfo })
			})
		end
	end,
	[v13.name] = function(p25, p26)
		-- upvalues: (copy) v_u_4
		local v27 = v_u_4.Dictionary.join
		local v28 = {
			["promptInfo"] = v_u_4.Dictionary.join(p25.promptInfo, {
				["humanoidModel"] = p26.humanoidModel
			})
		}
		return v27(p25, v28)
	end,
	[v14.name] = function(p29, p30)
		-- upvalues: (copy) v_u_4
		local v31 = v_u_4.Dictionary.join
		local v32 = {
			["promptInfo"] = v_u_4.Dictionary.join(p29.promptInfo, {
				["accessoryInstance"] = p30.accessoryInstance
			})
		}
		return v31(p29, v32)
	end,
	[v15.name] = function(p33, p34)
		-- upvalues: (copy) v_u_4
		local v35 = v_u_4.Dictionary.join
		local v36 = {
			["promptInfo"] = v_u_4.Dictionary.join(p33.promptInfo, {
				["priceInRobux"] = p34.priceInRobux
			})
		}
		return v35(p33, v36)
	end,
	[v9.name] = function(p37, _)
		-- upvalues: (copy) v_u_4
		return v_u_4.isEmpty(p37.queue) and {
			["promptInfo"] = {},
			["queue"] = p37.queue
		} or v_u_4.Dictionary.join(p37, {
			["promptInfo"] = p37.queue[1],
			["queue"] = v_u_4.List.removeIndex(p37.queue, 1)
		})
	end,
	[v10.name] = function(p38, p39)
		-- upvalues: (copy) v_u_4
		return v_u_4.Dictionary.join(p38, {
			["resultModalType"] = p39.resultType
		})
	end,
	[v11.name] = function(p40, _)
		-- upvalues: (copy) v_u_4
		return v_u_4.Dictionary.join(p40, {
			["resultModalType"] = v_u_4.None
		})
	end,
	[v12.name] = function(p41, p42)
		-- upvalues: (copy) v_u_4
		local v43 = v_u_4.Dictionary.join
		local v44 = {
			["promptInfo"] = v_u_4.Dictionary.join(p41.promptInfo, {
				["errorMessage"] = p42.errorMessage
			})
		}
		return v43(p41, v44)
	end,
	[v16.name] = function(p45, p46)
		-- upvalues: (copy) v_u_4
		local v47 = v_u_4.Dictionary.join
		local v48 = {
			["promptInfo"] = v_u_4.Dictionary.join(p45.promptInfo, {
				["promptVisible"] = p46.promptVisible
			})
		}
		return v47(p45, v48)
	end
})