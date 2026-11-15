-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useGuiInset
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Utility.Wrappers)
local v_u_5 = require(v1.Utility.isPluginSecurity)
local v_u_6 = v4.Connection
local v_u_7 = v4.Instance
local v_u_8 = v4.Signal
local v_u_9 = v4.Services.GuiService
local v_u_10 = v4.Services.UserInputService
local function v_u_13() -- name: getGuiInset
	-- upvalues: (copy) v_u_9
	local v11, v12 = v_u_9:GetGuiInset()
	return Rect.new(v11, v12)
end
return function() -- name: useGuiInset
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_5, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_10, (copy) v_u_6
	local v14, v_u_15 = v_u_3.useState(function()
		-- upvalues: (ref) v_u_13
		return v_u_13()
	end)
	local v_u_16 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_15, (ref) v_u_13
		v_u_15(v_u_13())
	end, {})
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_8, (ref) v_u_9, (copy) v_u_16, (ref) v_u_7, (ref) v_u_10, (ref) v_u_6
		local v_u_17 = v_u_5() and { v_u_8.Connect(v_u_9.SafeZoneOffsetsChanged, v_u_16), v_u_8.Connect(v_u_7.GetPropertyChangedSignal(v_u_10, "BottomBarSize"), v_u_16), v_u_8.Connect(v_u_7.GetPropertyChangedSignal(v_u_10, "RightBarSize"), v_u_16) } or {}
		return function()
			-- upvalues: (ref) v_u_17, (ref) v_u_6
			for _, v18 in v_u_17 do
				v_u_6.Disconnect(v18)
			end
		end
	end, {})
	return v14
end