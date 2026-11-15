-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ChipGroup.useClippingRect
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
return function(p_u_3) -- name: useClippingRect
	-- upvalues: (copy) v_u_2
	local v4, v_u_5 = v_u_2.useBinding(Rect.new(Vector2.zero, Vector2.zero))
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_3, (copy) v_u_5
		if not p_u_3.current then
			return
		end
		local v6 = p_u_3.current.Parent
		local v7 = nil
		while true do
			if not v6 then
				v6 = v7
				break
			end
			if v6:IsA("GuiObject") and v6.ClipsDescendants then
				break
			end
			v6 = v6.Parent
		end
		local v_u_8
		if v6 then
			v_u_8 = v6
		else
			v_u_8 = p_u_3.current:FindFirstAncestorWhichIsA("LayerCollector")
			if not (v_u_8 and v_u_8:IsA("GuiBase2d")) then
				v_u_8 = v6
			end
		end
		local function v9() -- name: update
			-- upvalues: (ref) v_u_8, (ref) v_u_5
			if v_u_8 then
				v_u_5(Rect.new(v_u_8.AbsolutePosition, v_u_8.AbsolutePosition + v_u_8.AbsoluteSize))
			end
		end
		local v_u_10 = {}
		if v_u_8 then
			local v11 = v_u_8:GetPropertyChangedSignal("AbsolutePosition")
			table.insert(v_u_10, v11:Connect(v9))
			local v12 = v_u_8:GetPropertyChangedSignal("AbsoluteSize")
			table.insert(v_u_10, v12:Connect(v9))
		end
		if v_u_8 then
			v_u_5(Rect.new(v_u_8.AbsolutePosition, v_u_8.AbsolutePosition + v_u_8.AbsoluteSize))
		end
		return function()
			-- upvalues: (copy) v_u_10
			for _, v13 in v_u_10 do
				v13:Disconnect()
			end
		end
	end, {})
	return v4
end