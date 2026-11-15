-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.VirtualKeyboardMonitor
local v_u_1 = game:GetService("UserInputService")
local v_u_5 = {
	["getInstance"] = function(p2) -- name: getInstance
		if not p2._initialized then
			p2:initialize()
			p2._initialized = true
		end
		return p2
	end,
	["initialize"] = function(p_u_3) -- name: initialize
		-- upvalues: (copy) v_u_1
		p_u_3._isKeyboardJustOff = false
		v_u_1:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: (ref) v_u_1, (copy) p_u_3
			if not v_u_1.OnScreenKeyboardVisible then
				p_u_3._isKeyboardJustOff = true
			end
		end)
		v_u_1.InputEnded:Connect(function(_)
			-- upvalues: (copy) p_u_3
			if p_u_3._isKeyboardJustOff then
				p_u_3._isKeyboardJustOff = false
			end
		end)
	end,
	["isKeyboardJustOff"] = function(p4) -- name: isKeyboardJustOff
		return p4._isKeyboardJustOff
	end
}
return {
	["getInstance"] = function() -- name: getInstance
		-- upvalues: (copy) v_u_5
		return v_u_5:getInstance()
	end
}