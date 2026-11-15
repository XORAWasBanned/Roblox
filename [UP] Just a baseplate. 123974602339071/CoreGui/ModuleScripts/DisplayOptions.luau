-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Reducers.DisplayOptions
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.ShowMenu)
local v6 = require(v4.HideMenu)
local v7 = require(v4.ShowError)
local v8 = require(v4.HideError)
local v9 = require(v4.SetGuiInset)
return v3.createReducer({
	["menuVisible"] = false,
	["guiInset"] = 0,
	["errorVisible"] = false,
	["errorText"] = ""
}, {
	[v5.name] = function(p10, _)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p10, {
			["menuVisible"] = true
		})
	end,
	[v6.name] = function(p11, _)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p11, {
			["menuVisible"] = false
		})
	end,
	[v7.name] = function(p12, p13)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p12, {
			["errorVisible"] = true,
			["errorText"] = nil,
			["errorText"] = p13.errorText
		})
	end,
	[v8.name] = function(p14, _)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p14, {
			["errorVisible"] = false
		})
	end,
	[v9.name] = function(p15, p16)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p15, {
			["guiInset"] = p16.guiInset
		})
	end
})