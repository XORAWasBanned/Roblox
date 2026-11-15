-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalSlider.useSliderThumbs
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Slider.calculateSliderStepValue)
local v_u_5 = require(v1.Components.Slider.calculateSliderValueFraction)
return function(p_u_6) -- name: useSliderThumbs
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v_u_8 = v_u_3.useCallback(function(p7)
		-- upvalues: (ref) v_u_5, (copy) p_u_6
		return v_u_5(p7, p_u_6.range)
	end, { p_u_6.range })
	local v_u_11 = v_u_3.useCallback(function(p9)
		-- upvalues: (copy) p_u_6, (ref) v_u_4
		local v10 = p_u_6.range.Min + p9 * (p_u_6.range.Max - p_u_6.range.Min)
		if p_u_6.step then
			return v_u_4(v10, p_u_6.step, p_u_6.range)
		else
			return v10
		end
	end, { p_u_6.range, p_u_6.step })
	local v_u_18 = v_u_3.useCallback(function(p12)
		-- upvalues: (copy) p_u_6, (copy) v_u_8
		local v13 = p_u_6.range.Min
		local v14 = p_u_6.range.Max
		local v15 = math.clamp(p12, v13, v14)
		if not p_u_6.step or p_u_6.step <= 0 then
			return v_u_8(v15)
		end
		local v16 = (v15 - p_u_6.range.Min) / p_u_6.step + 0.5
		local v17 = math.floor(v16)
		return v_u_8(p_u_6.range.Min + v17 * p_u_6.step)
	end, {
		p_u_6.range.Min,
		p_u_6.range.Max,
		p_u_6.step,
		v_u_8
	})
	local v_u_21 = v_u_3.useCallback(function(p19)
		-- upvalues: (copy) v_u_18, (copy) p_u_6
		local v20 = p19 <= 1 and 0 or v_u_18(p_u_6.thumbs[p19 - 1].value:getValue())
		if p19 < #p_u_6.thumbs then
			return v20, v_u_18(p_u_6.thumbs[p19 + 1].value:getValue())
		else
			return v20, 1
		end
	end, { p_u_6.thumbs, v_u_18 })
	local v_u_26 = v_u_3.useCallback(function(p22, p23)
		-- upvalues: (copy) p_u_6
		if p22 > 1 then
			local v24 = p_u_6.thumbs[p22 - 1].value
			p23 = math.max(p23, v24:getValue())
		end
		if p22 < #p_u_6.thumbs then
			local v25 = p_u_6.thumbs[p22 + 1].value
			p23 = math.min(p23, v25:getValue())
		end
		return p23
	end, { p_u_6.thumbs })
	local v_u_29 = v_u_3.useCallback(function(p27, p28)
		-- upvalues: (copy) p_u_6
		if p28 ~= p_u_6.thumbs[p27].value:getValue() then
			p_u_6.onValueChanged(p27, p28)
		end
	end, { p_u_6.thumbs, p_u_6.onValueChanged })
	local v34 = v_u_3.useCallback(function(p30, p31)
		-- upvalues: (copy) v_u_21, (copy) v_u_29, (copy) v_u_26, (copy) v_u_11
		local v32, v33 = v_u_21(p30)
		v_u_29(p30, v_u_26(p30, v_u_11((math.clamp(p31, v32, v33)))))
	end, {
		v_u_21,
		v_u_29,
		v_u_26,
		v_u_11
	})
	local v35 = {}
	for v36 = 1, #p_u_6.thumbs do
		v35[v36] = p_u_6.thumbs[v36].value:map(v_u_8)
	end
	return {
		["fractions"] = v35,
		["toFraction"] = v_u_8,
		["valueFromFraction"] = v_u_11,
		["getSnappedFraction"] = v_u_18,
		["getThumbBounds"] = v_u_21,
		["clampToNeighbors"] = v_u_26,
		["updateThumbValue"] = v_u_29,
		["seekThumb"] = v34
	}
end