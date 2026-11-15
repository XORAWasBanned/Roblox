-- Path: CorePackages.Packages._Index.React.React.ReactMutableSource
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
require(v1.Shared)
return function(p3, p4) -- name: createMutableSource
	-- upvalues: (copy) v_u_2
	local v5 = {
		["_getVersion"] = nil,
		["_source"] = nil,
		["_workInProgressVersionPrimary"] = nil,
		["_workInProgressVersionSecondary"] = nil,
		["_getVersion"] = p4,
		["_source"] = p3
	}
	if v_u_2.__DEV__ then
		v5._currentPrimaryRenderer = nil
		v5._currentSecondaryRenderer = nil
	end
	return v5
end