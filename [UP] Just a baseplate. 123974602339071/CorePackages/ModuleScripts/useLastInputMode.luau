-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.Input.useLastInputMode
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = require(v2.React)
local v_u_5 = require(v2.ReactUtils).useEventConnection
require(v1.Utility.Input.InputMode)
local v_u_6 = require(v1.Utility.Input.getInputMode)
local function v_u_7() -- name: getLastInputMode
	-- upvalues: (copy) v_u_6, (copy) v_u_3
	return v_u_6(v_u_3:GetLastInputType())
end
return function() -- name: useLastInputMode
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_5, (copy) v_u_3
	local v8, v_u_9 = v_u_4.useState(v_u_7)
	v_u_5(v_u_3.LastInputTypeChanged, function()
		-- upvalues: (copy) v_u_9, (ref) v_u_7
		v_u_9(v_u_7())
	end)
	return v8
end