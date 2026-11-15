-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Grid.Debug.GridDebugStyleSheet
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactUtils).useForwardRef
local v_u_5 = require(v1.StyleSheet.StyleRule)
local v_u_6 = require(v1.Providers.Style.StyleSheetContext).useStyleSheet
require(v1.Enums.Breakpoint)
require(v1.Enums.BreakpointShortName)
local v_u_7 = require(v1.Providers.Responsive.useResponsive)
return v_u_3.memo(v_u_3.forwardRef(function(p8, p9) -- name: GridDebugStyleSheet
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v10 = v_u_7()
	local v_u_11 = v_u_6()
	local v_u_12, v13 = v_u_3.useState(nil)
	local v14 = v_u_4(p9, v13)
	local v_u_15 = v10.config.breakpoint
	local v_u_16 = v10.config.grid
	local v17 = v_u_15.order[#v_u_15.order]
	local v_u_18 = p8.breakpoint or v17
	local v35 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_15, (copy) v_u_18, (copy) v_u_16, (ref) v_u_3, (ref) v_u_5
		local v19 = v_u_15.shortNames[v_u_18]
		local v20 = v_u_16.columns[v_u_18]
		local v21 = {}
		for v22 = 0, v20 do
			local v23
			if v19 then
				v23 = (".%*-col-%*"):format(v19, v22)
			else
				v23 = (".col-%*"):format(v22)
			end
			local v24 = ("DebugColColor$%*"):format(v22)
			local v25 = v_u_3.createElement
			local v26 = v_u_5
			local v27 = {
				["Selector"] = v23
			}
			local v28 = {}
			local v29 = Color3.fromRGB
			local v30 = v22 / math.max(1, v20) * 255
			local v31 = math.floor(v30)
			local v32 = (1 - v22 / math.max(1, v20)) * 255
			local v33 = math.floor(v32)
			local v34 = v22 % 3 / 2 * 255
			v28.BackgroundColor3 = v29(v31, v33, (math.floor(v34)))
			v27.properties = v28
			v21[v24] = v25(v26, v27)
		end
		return v21
	end, { v_u_18, v_u_15, v_u_16 })
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) v_u_12, (copy) v_u_11
		if v_u_12 then
			v_u_12:SetDerives({ v_u_11 })
		end
	end, { v_u_12, v_u_11 })
	local v36 = v_u_3.createElement
	local v37 = v_u_3.Fragment
	local v38 = {
		["GridDebugStyleSheet"] = v_u_3.createElement("StyleSheet", {
			["ref"] = v14
		}, v35),
		["GridDebugStyleLink"] = v_u_3.createElement("StyleLink", {
			["StyleSheet"] = v_u_12
		})
	}
	return v36(v37, nil, v38)
end))