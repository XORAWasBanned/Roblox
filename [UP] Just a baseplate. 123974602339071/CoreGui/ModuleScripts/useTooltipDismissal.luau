-- Path: CoreGui.RobloxGui.Modules.SelfieView.Hooks.useTooltipDismissal
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v3 = v1.Packages
local v_u_4 = require(v3.React)
local v5 = require(v3.LuauPolyfill)
local v_u_6 = v5.setTimeout
local v_u_7 = v5.clearTimeout
return function(p_u_8)
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_6, (copy) v_u_2
	local v9, v_u_10 = v_u_4.useState("")
	local v11, v_u_12 = v_u_4.useState("")
	local v13, v_u_14 = v_u_4.useState(false)
	local v_u_15 = v_u_4.useRef(nil)
	local v_u_16 = v_u_4.useRef(nil)
	local v_u_17 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_16, (ref) v_u_7, (copy) v_u_15
		if v_u_16.current then
			v_u_7(v_u_16.current)
		end
		if v_u_15.current then
			v_u_15.current:Disconnect()
			v_u_15.current = nil
		end
	end, { v_u_16, v_u_15 })
	local v_u_19 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_17, (copy) v_u_14, (copy) v_u_16, (ref) v_u_6, (copy) p_u_8, (copy) v_u_15, (ref) v_u_2
		v_u_17()
		v_u_14(true)
		v_u_16.current = v_u_6(function()
			-- upvalues: (ref) v_u_17, (ref) v_u_14
			v_u_17()
			v_u_14(false)
		end, p_u_8)
		v_u_15.current = v_u_2.InputBegan:Connect(function(p18, _)
			-- upvalues: (ref) v_u_17, (ref) v_u_14
			if p18.UserInputType == Enum.UserInputType.MouseButton1 and true or p18.UserInputType == Enum.UserInputType.Touch then
				v_u_17()
				v_u_14(false)
			end
		end)
	end, { v_u_16, v_u_15 })
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_17
		return v_u_17
	end, {})
	return v9, v11, v13, v_u_4.useCallback(function(p20, p21)
		-- upvalues: (copy) v_u_10, (copy) v_u_12, (copy) v_u_19
		v_u_10(p20)
		v_u_12(p21)
		v_u_19()
	end, {})
end