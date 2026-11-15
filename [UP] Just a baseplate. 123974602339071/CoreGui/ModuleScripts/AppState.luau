-- Path: CoreGui.RobloxGui.Modules.Shell.AppState
local v1 = game:GetService("CorePackages")
game:GetService("CoreGui")
local v2 = require(script.Parent.Reducers.AppShellReducer)
local v3 = require(v1.Packages.Rodux)
local v5 = {
	["Destruct"] = function(p4) -- name: Destruct
		p4.store:destruct()
	end
}
local v6 = { v3.thunkMiddleware }
v5.store = v3.Store.new(v2, {}, v6, nil)
return v5