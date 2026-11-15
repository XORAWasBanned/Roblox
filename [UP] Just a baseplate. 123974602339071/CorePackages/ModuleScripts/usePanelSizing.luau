-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.ContentPlugin.usePanelSizing
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v1.Constants)
require(v1.Providers.StudioPanels.Types)
require(v1.Enums.PopoverAlign)
require(v1.Enums.PopoverSide)
local v_u_4 = require(v2.React)
local v_u_5 = require(script.Parent.Parent.positioning)
local v_u_6 = v3.SHADOW_SIZE
return function(p_u_7, p_u_8, p_u_9, p_u_10, p_u_11) -- name: usePanelSizing
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	local v12, v_u_13 = v_u_4.useBinding(UDim2.new())
	local v14, v_u_15 = v_u_4.useBinding(UDim2.new())
	local v_u_16 = v_u_4.useRef(nil)
	local v_u_17 = v_u_4.useRef(function() end)
	local v_u_27 = v_u_4.useCallback(function()
		-- upvalues: (copy) p_u_9, (copy) p_u_7, (copy) p_u_8, (copy) p_u_10, (ref) v_u_5, (ref) v_u_6, (copy) v_u_15, (copy) v_u_13, (copy) p_u_11, (copy) v_u_16
		if p_u_9 then
			local v18 = p_u_9.AbsoluteSize
			local v19 = p_u_7
			local v20
			if type(v19) == "table" then
				v20 = p_u_7.position
			else
				v20 = p_u_7
			end
			local v21 = p_u_7
			local v22 = type(v21) ~= "table" and 0 or p_u_7.offset
			local v23 = p_u_8
			local v24 = type(v23) ~= "table" and 0 or p_u_8.offset
			local v25 = p_u_10 or 0
			local v_u_26 = v_u_5.calculatePopoverBounds(v20, v22, v24, v25, v18) + Vector2.new(v_u_6 * 2, v_u_6 * 2)
			v_u_15(UDim2.fromOffset(v18.X, v18.Y))
			v_u_13(UDim2.fromOffset(v_u_26.X, v_u_26.Y))
			local _ = p_u_9.AbsolutePosition
			if p_u_11 then
				if v_u_16.current then
					task.cancel(v_u_16.current)
				end
				v_u_16.current = task.spawn(function()
					-- upvalues: (ref) p_u_11, (copy) v_u_26
					p_u_11.setSizeAsync(v_u_26)
				end)
			end
		end
	end, {
		p_u_9,
		p_u_7,
		p_u_8,
		p_u_10,
		p_u_11
	})
	v_u_17.current = v_u_27
	local v_u_28 = { "AbsoluteSize" }
	v_u_4.useLayoutEffect(function()
		-- upvalues: (copy) p_u_9, (copy) v_u_28, (copy) v_u_17
		local v_u_29 = {}
		if p_u_9 ~= nil then
			for _, v30 in v_u_28 do
				local v31 = p_u_9:GetPropertyChangedSignal(v30)
				local v32 = v_u_17
				local v33
				if type(v32) == "table" then
					v33 = function()
						-- upvalues: (ref) v_u_17
						v_u_17.current()
					end
				else
					v33 = v_u_17
				end
				v_u_29[v30] = v31:Connect(v33)
			end
		end
		return function()
			-- upvalues: (copy) v_u_29
			for _, v34 in v_u_29 do
				v34:Disconnect()
			end
		end
	end, { p_u_9, v_u_17 })
	v_u_4.useLayoutEffect(function()
		-- upvalues: (copy) v_u_27
		v_u_27()
	end, { v_u_27 })
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_16
		return function()
			-- upvalues: (ref) v_u_16
			if v_u_16.current then
				task.cancel(v_u_16.current)
			end
		end
	end, {})
	return v12, v14
end