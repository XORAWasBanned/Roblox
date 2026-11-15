-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Calendar.useScrollToSelectedRef
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Dropdown)
return function(p_u_4, p_u_5) -- name: useScrollToSelectedRef
	-- upvalues: (copy) v_u_3
	local v_u_6 = v_u_3.useRef(nil)
	local v_u_8 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_6
		if v_u_6.current then
			for _, v7 in v_u_6.current do
				v7:Disconnect()
			end
			v_u_6.current = nil
		end
	end, {})
	local v23 = v_u_3.useCallback(function(p_u_9)
		-- upvalues: (copy) v_u_8, (copy) p_u_4, (copy) p_u_5, (copy) v_u_6
		v_u_8()
		if p_u_9 then
			local function v_u_21() -- name: scrollToSelected
				-- upvalues: (ref) p_u_4, (copy) p_u_9, (ref) p_u_5
				local v10 = #p_u_4
				local v11 = p_u_9.AbsoluteCanvasSize.Y
				local v12 = p_u_9.AbsoluteWindowSize.Y
				if v10 == 0 or (v12 <= 0 or v11 <= v12) then
					return false
				end
				local v13 = v11 / v10
				local v14 = 0
				for v15, v16 in p_u_4 do
					if v16.id ~= p_u_5 then
						continue
					end
					v14 = v15 - 1
				end
				local v17 = v14 * v13 - v12 / 2 + v13 / 2
				local v18 = p_u_9
				local v19 = Vector2.new
				local v20 = v11 - v12
				v18.CanvasPosition = v19(0, (math.clamp(v17, 0, v20)))
				return true
			end
			if not v_u_21() then
				local function v22() -- name: onSizeChanged
					-- upvalues: (copy) v_u_21, (ref) v_u_8
					if v_u_21() then
						v_u_8()
					end
				end
				v_u_6.current = { p_u_9:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v22), p_u_9:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v22) }
			end
		end
	end, { p_u_4, p_u_5, v_u_8 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_8
		return v_u_8
	end, { v_u_8 })
	return v23
end