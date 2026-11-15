-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useInputPlatform.useInputPlatform
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Wrappers.Services).UserInputService
require(v1.Enums.InputPlatform)
local v_u_5 = require(script.Parent.detectInputPlatform)
return function() -- name: useInputPlatform
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v6, v_u_7 = v_u_3.useState(v_u_5)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_7, (ref) v_u_5, (ref) v_u_4
		local function v8() -- name: refresh
			-- upvalues: (ref) v_u_7, (ref) v_u_5
			v_u_7(v_u_5())
		end
		local v_u_9 = v_u_4.GamepadConnected:Connect(v8)
		local v_u_10 = v_u_4.GamepadDisconnected:Connect(v8)
		v_u_7(v_u_5())
		return function()
			-- upvalues: (copy) v_u_9, (copy) v_u_10
			v_u_9:Disconnect()
			v_u_10:Disconnect()
		end
	end, {})
	return v6
end