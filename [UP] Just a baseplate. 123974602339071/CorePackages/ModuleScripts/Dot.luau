-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.CarouselIndicator.Dot
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.Otter)
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactOtter)
local v_u_5 = require(v1.Enums.StateLayerMode)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Providers.Style.useTokens)
return v_u_3.memo(v_u_3.forwardRef(function(p_u_8, p9) -- name: Dot
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6
	local v10 = v_u_7()
	local v_u_11 = v10.Color.System.Contrast
	local v_u_12 = p_u_8.isActive and (v_u_11.Transparency or 0) or 0.78
	local v13 = UDim.new(0, v10.Radius.Circle)
	local v14, v_u_15 = v_u_4.useAnimatedBinding(p_u_8.scale)
	local v16, v_u_17 = v_u_4.useAnimatedBinding(v_u_12)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_15, (ref) v_u_4, (copy) p_u_8
		v_u_15(v_u_4.ease(p_u_8.scale, p_u_8.scaleEaseConfig))
	end, { p_u_8.scale, p_u_8.scaleEaseConfig })
	local v18 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_8
		return {
			["Selectable"] = p_u_8.Selectable,
			["NextSelectionUp"] = p_u_8.NextSelectionUp,
			["NextSelectionDown"] = p_u_8.NextSelectionDown,
			["NextSelectionLeft"] = p_u_8.NextSelectionLeft,
			["NextSelectionRight"] = p_u_8.NextSelectionRight
		}
	end, {
		p_u_8.Selectable,
		p_u_8.NextSelectionUp,
		p_u_8.NextSelectionDown,
		p_u_8.NextSelectionLeft,
		p_u_8.NextSelectionRight
	})
	local v19 = v_u_3.useCallback(function()
		-- upvalues: (copy) p_u_8
		if p_u_8.onActivated ~= nil and not p_u_8.isActive then
			p_u_8.onActivated(p_u_8.page)
		end
	end, { p_u_8.isActive, p_u_8.onActivated, p_u_8.page })
	local v22 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_8, (ref) v_u_5
		local v20 = {}
		local v21
		if p_u_8.isActive then
			v21 = v_u_5.Inverse
		else
			v21 = v_u_5.Default
		end
		v20.mode = v21
		return v20
	end, { p_u_8.isActive })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_17, (ref) v_u_4, (copy) v_u_12, (copy) p_u_8
		v_u_17(v_u_4.ease(v_u_12, p_u_8.colorEaseConfig))
	end, { v_u_12, p_u_8.colorEaseConfig })
	local v23 = v_u_3.createElement
	local v24 = v_u_6
	local v26 = {
		["LayoutOrder"] = p_u_8.LayoutOrder,
		["Size"] = UDim2.fromOffset(p_u_8.maxSize, p_u_8.maxSize),
		["backgroundStyle"] = v16:map(function(p25)
			-- upvalues: (copy) v_u_11
			return {
				["Color3"] = v_u_11.Color3,
				["Transparency"] = p25
			}
		end),
		["cornerRadius"] = v13
	}
	if not p_u_8.onActivated then
		v19 = nil
	end
	v26.onActivated = v19
	v26.selection = v18
	v26.stateLayer = v22
	v26.ref = p9
	v26.testId = p_u_8.testId
	v26.scale = v14
	return v23(v24, v26)
end))