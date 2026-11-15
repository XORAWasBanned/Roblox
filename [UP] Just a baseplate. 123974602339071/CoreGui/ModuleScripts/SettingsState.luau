-- Path: CoreGui.RobloxGui.Modules.Settings.SettingsState
local v1 = game:GetService("CorePackages")
local v2 = script.Parent
local v3 = require(v2.Reducers.SettingsReducer)
local v4 = require(v1.Packages.Rodux)
return {
	["Destruct"] = function(p5) -- name: Destruct
		p5.store:destruct()
	end,
	["store"] = v4.Store.new(v3, nil, { v4.thunkMiddleware })
}