-- Path: CoreGui.RobloxGui.Modules.InGameMenu.reducer.nativeClosePrompt
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v3 = v2.Rodux
local v_u_4 = v2.Cryo
local v5 = script.Parent.Parent
local v6 = require(v5.Actions.OpenNativeClosePrompt)
local v7 = require(v5.Actions.CloseNativeClosePrompt)
local v8 = require(v5.Actions.SetMenuIconTooltipOpen)
return v3.createReducer({
	["closingApp"] = false,
	["menuIconTooltipOpen"] = false
}, {
	[v6.name] = function(p9, _)
		-- upvalues: (copy) v_u_4
		return v_u_4.Dictionary.join(p9, {
			["closingApp"] = true
		})
	end,
	[v7.name] = function(p10, _)
		-- upvalues: (copy) v_u_4
		return v_u_4.Dictionary.join(p10, {
			["closingApp"] = false
		})
	end,
	[v8.name] = function(p11, p12)
		-- upvalues: (copy) v_u_4
		return v_u_4.Dictionary.join(p11, {
			["menuIconTooltipOpen"] = p12.menuIconTooltipOpen
		})
	end
})