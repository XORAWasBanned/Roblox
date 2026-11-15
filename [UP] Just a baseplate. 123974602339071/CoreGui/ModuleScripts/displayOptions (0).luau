-- Path: CoreGui.RobloxGui.Modules.InGameMenu.reducer.displayOptions
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies).Rodux
local v3 = script.Parent.Parent
local v4 = require(v3.Resources.Constants)
local v5 = require(v3.Actions.SetInspectMenuEnabled)
local v6 = require(v3.Actions.SetInputType)
local v7 = v4.InputType
return v2.createReducer({
	["inspectMenuEnabled"] = true,
	["inputType"] = nil,
	["inputType"] = v7.MouseAndKeyboard
}, {
	[v5.name] = function(p8, p9)
		return {
			["inspectMenuEnabled"] = p9.enabled,
			["inputType"] = p8.inputType
		}
	end,
	[v6.name] = function(p10, p11)
		return {
			["inspectMenuEnabled"] = p10.inspectMenuEnabled,
			["inputType"] = p11.inputType
		}
	end
})