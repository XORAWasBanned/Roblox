-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Hooks.useOnScreenKeyboardHeight
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
local v2 = require(v1.React)
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = v2.useEffect
local v_u_5 = v2.useState
return function()
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
	local v6, v_u_7 = v_u_5(0)
	v_u_4(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_7
		local v_u_8 = v_u_3:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_3
			v_u_7(v_u_3.OnScreenKeyboardVisible and v_u_3.OnScreenKeyboardSize.Y or 0)
		end)
		return function()
			-- upvalues: (copy) v_u_8
			v_u_8:Disconnect()
		end
	end, {})
	return v6
end