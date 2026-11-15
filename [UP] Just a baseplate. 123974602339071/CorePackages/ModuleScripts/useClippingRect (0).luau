-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.OverflowScrollContainer.useClippingRect
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Flags)
local v5 = require(v1.Utility.Wrappers)
local v_u_6 = v5.Connection
local v_u_7 = v5.Instance
local v_u_8 = v5.Signal
return function(p_u_9) -- name: useClippingRect
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6
	local v10, v_u_11 = v_u_3.useBinding(Rect.new(Vector2.zero, Vector2.zero))
	local v12, v_u_13 = v_u_3.useState(true)
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_9, (ref) v_u_4, (copy) v_u_13, (copy) v_u_11, (ref) v_u_8, (ref) v_u_7, (ref) v_u_6
		local v_u_14 = p_u_9.current
		if not (v_u_14 and v_u_14:IsA("GuiObject")) then
			return
		end
		local v15 = v_u_14.Parent
		local v16 = nil
		while true do
			if not v15 then
				v15 = v16
				break
			end
			if v15:IsA("GuiObject") and v15.ClipsDescendants then
				break
			end
			v15 = v15.Parent
		end
		if v_u_4.FoundationUnifiedScrimScrolling then
			v_u_13(v15 ~= nil)
		end
		local v_u_17
		if v15 then
			v_u_17 = v15
		elseif v_u_4.FoundationUnifiedScrimScrolling then
			v_u_17 = v_u_14
		else
			v_u_17 = v_u_14:FindFirstAncestorWhichIsA("LayerCollector")
			if not (v_u_17 and v_u_17:IsA("GuiBase2d")) then
				v_u_17 = v15
			end
		end
		local function v19() -- name: update
			-- upvalues: (ref) v_u_17, (copy) v_u_14, (ref) v_u_11
			if v_u_17 then
				local v18 = v_u_14.AbsolutePosition
				v_u_11(Rect.new(v_u_17.AbsolutePosition - v18, v_u_17.AbsolutePosition + v_u_17.AbsoluteSize - v18))
			end
		end
		local v_u_20 = { v_u_8.Connect(v_u_7.GetPropertyChangedSignal(v_u_14, "AbsolutePosition"), v19) }
		if v_u_17 then
			local v21 = v_u_8.Connect
			local v22 = v_u_7.GetPropertyChangedSignal(v_u_17, "AbsolutePosition")
			table.insert(v_u_20, v21(v22, v19))
			local v23 = v_u_8.Connect
			local v24 = v_u_7.GetPropertyChangedSignal(v_u_17, "AbsoluteSize")
			table.insert(v_u_20, v23(v24, v19))
		end
		if v_u_17 then
			local v25 = v_u_14.AbsolutePosition
			v_u_11(Rect.new(v_u_17.AbsolutePosition - v25, v_u_17.AbsolutePosition + v_u_17.AbsoluteSize - v25))
		end
		return function()
			-- upvalues: (copy) v_u_20, (ref) v_u_6
			for _, v26 in v_u_20 do
				v_u_6.Disconnect(v26)
			end
		end
	end, {})
	return v10, v12
end