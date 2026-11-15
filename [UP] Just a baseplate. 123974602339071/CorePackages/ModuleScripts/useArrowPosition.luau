-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.ContentPlugin.useArrowPosition
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Constants)
local v5 = require(v1.Utility.Flags)
local v_u_6 = require(v1.Enums.PopoverSide)
local v_u_7 = require(v1.Enums.Radius)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v_u_9
if v5.FoundationPopoverPluginOverlayMeasurement and v5.FoundationPluginShadowSize then
	v_u_9 = v4.PLUGIN_SHADOW_SIZE
else
	v_u_9 = v4.SHADOW_SIZE
end
return function(p10, p_u_11, p_u_12, p_u_13, p_u_14, p_u_15) -- name: useArrowPosition
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_7, (copy) v_u_6, (copy) v_u_9
	local v_u_16 = v_u_8()
	local v_u_17 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_12, (ref) v_u_7, (copy) v_u_16
		if p_u_12 == v_u_7.XSmall then
			return v_u_16.Size.Size_50
		elseif p_u_12 == v_u_7.Small then
			return v_u_16.Size.Size_100
		elseif p_u_12 == v_u_7.Medium then
			return v_u_16.Size.Size_200
		else
			return p_u_12 ~= v_u_7.Large and 0 or v_u_16.Size.Size_300
		end
	end, { p_u_12, v_u_16 })
	return p10:map(function(p18)
		-- upvalues: (copy) v_u_17, (copy) p_u_12, (ref) v_u_7, (copy) p_u_14, (copy) p_u_11, (ref) v_u_6, (copy) p_u_15, (copy) p_u_13, (ref) v_u_9
		local v19 = p18.X.Offset
		local v20 = p18.Y.Offset
		local v21 = v_u_17
		if p_u_12 == v_u_7.Circle then
			v21 = math.min(v19, v20) / 2
		end
		local v22 = v21 + p_u_14
		local v23 = p_u_11 == v_u_6.Top and true or p_u_11 == v_u_6.Bottom
		local v24
		if v23 then
			v24 = v19
		else
			v24 = v20
		end
		local v25, v26, v27
		if p_u_15 then
			local v28 = p_u_15
			if typeof(v28) == "Instance" then
				local v29 = p_u_15.AbsoluteSize
				local v30
				if v23 then
					v30 = v29.X
				else
					v30 = v29.Y
				end
				local v31
				if p_u_13 == 0 then
					v31 = 0
				elseif p_u_13 == 0.5 then
					v31 = (v24 - v30) / 2
				else
					v31 = v24 - v30
				end
				local v32 = math.max(0, v31)
				local v33 = v31 + v30
				local v34 = math.min(v24, v33)
				if v32 <= v34 then
					v25 = (v32 + v34) / 2
				elseif v24 < v31 then
					v25 = v24 - p_u_14
				else
					v25 = p_u_14
				end
				v26 = v24 - v22
				if v22 <= v26 then
					v27 = math.clamp(v25, v22, v26)
				else
					v27 = v24 / 2
				end
				if v23 then
					return UDim2.fromOffset(v_u_9 + v27, v_u_9 + (p_u_11 ~= v_u_6.Top and 0 or v20))
				else
					return UDim2.fromOffset(v_u_9 + (p_u_11 ~= v_u_6.Left and 0 or v19), v_u_9 + v27)
				end
			else
				v25 = v24 * p_u_13
				v26 = v24 - v22
				if v22 <= v26 then
					v27 = math.clamp(v25, v22, v26)
				else
					v27 = v24 / 2
				end
				if v23 then
					return UDim2.fromOffset(v_u_9 + v27, v_u_9 + (p_u_11 ~= v_u_6.Top and 0 or v20))
				else
					return UDim2.fromOffset(v_u_9 + (p_u_11 ~= v_u_6.Left and 0 or v19), v_u_9 + v27)
				end
			end
		else
			v25 = v24 * p_u_13
			v26 = v24 - v22
			if v22 <= v26 then
				v27 = math.clamp(v25, v22, v26)
			else
				v27 = v24 / 2
			end
			if v23 then
				return UDim2.fromOffset(v_u_9 + v27, v_u_9 + (p_u_11 ~= v_u_6.Top and 0 or v20))
			else
				return UDim2.fromOffset(v_u_9 + (p_u_11 ~= v_u_6.Left and 0 or v19), v_u_9 + v27)
			end
		end
	end)
end