-- Path: CoreGui.RobloxGui.Modules.InGameMenu.createStore
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.InGameMenuDependencies).Rodux
local v3 = script.Parent
local v_u_4 = require(v3.GlobalConfig)
local v_u_5 = require(v3.reducer)
return function() -- name: createStore
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
	local v6 = { v_u_2.thunkMiddleware }
	if v_u_4.logStore then
		local v7 = v_u_2.loggerMiddleware
		table.insert(v6, v7)
	end
	return v_u_2.Store.new(v_u_5, nil, v6)
end