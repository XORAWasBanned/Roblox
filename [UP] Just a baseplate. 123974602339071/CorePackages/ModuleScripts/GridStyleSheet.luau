-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Grid.GridStyleSheet
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Providers.Style.StyleSheetContext).useStyleSheet
require(v1.Enums.Breakpoint)
local v_u_6 = require(script.Parent.createGridStyleRules)
local v_u_7 = require(v1.Utility.getGridMetrics)
local v_u_8 = require(v1.Providers.Responsive.useResponsive)
local v_u_9 = require(v1.Utility.withDefaults)
local v_u_10 = {
	["containerWidth"] = 0
}
return v_u_4.memo(function(p11) -- name: GridStyleSheet
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_4, (copy) v_u_8, (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_7
	local v12 = v_u_9(p11, v_u_10)
	local v_u_13 = v_u_4.useRef(nil)
	local v_u_14 = v_u_8()
	local v_u_15 = v_u_5()
	local v16 = v_u_14.config.breakpoint
	local v_u_17 = v_u_14.config.grid
	local v18 = v16.order[#v16.order]
	local v_u_19 = v_u_17.columns[v18]
	local v_u_20 = v12.breakpoint or v18
	local v21 = v12.containerWidth
	local v_u_22 = math.max(1, v21)
	local v_u_23 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_14
		return v_u_6(v_u_14.config)
	end, { v_u_14.config })
	local v24 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_23, (copy) v_u_20
		return v_u_3.join(v_u_23.baseRules, v_u_23.rulesByBreakpoint[v_u_20])
	end, { v_u_23, v_u_20 })
	v_u_4.useLayoutEffect(function()
		-- upvalues: (copy) v_u_13, (copy) v_u_17, (copy) v_u_20, (copy) v_u_19, (ref) v_u_7, (copy) v_u_14, (copy) v_u_22
		if v_u_13.current then
			local v25 = v_u_17.columns[v_u_20]
			for v26 = 0, v_u_19 do
				local v27 = math.min(v26, v25)
				local v28 = v_u_7(v_u_14.config, v_u_20, v_u_22, v27)
				local v29 = Vector2.new(v28.cellWidth, 0)
				local v30 = Vector2.new(v28.cellWidth, (1 / 0))
				v_u_13.current:SetAttribute("Col" .. v26, v28.cellSize)
				v_u_13.current:SetAttribute("ColMin" .. v26, v29)
				v_u_13.current:SetAttribute("ColMax" .. v26, v30)
			end
		end
	end, { v_u_14.config, v_u_22, v_u_20 })
	v_u_4.useLayoutEffect(function()
		-- upvalues: (copy) v_u_13, (copy) v_u_15
		if v_u_13.current then
			local v31 = { v_u_15 }
			v_u_13.current:SetDerives(v31)
		end
	end, { v_u_15 })
	local v32 = v_u_4.createElement
	local v33 = v_u_4.Fragment
	local v34 = {
		["GridStyleSheet"] = v_u_4.createElement("StyleSheet", {
			["ref"] = v_u_13
		}, v24),
		["GridStyleLink"] = v_u_4.createElement("StyleLink", {
			["StyleSheet"] = v_u_13.current
		})
	}
	return v32(v33, nil, v34)
end)