-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getGridMetrics
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v1.Enums.Breakpoint)
local v_u_3 = require(v2.Dash)
require(v1.Providers.Responsive.ResponsiveContext)
require(v1.Components.Types)
local function v_u_9(p4, p5, p6) -- name: getColumnMetrics
	local v7 = p4.grid.columns[p5]
	if p6 then
		if type(p6) == "table" then
			p6 = p6[p4.breakpoint.shortNames[p5]] or v7
		end
		v7 = math.clamp(p6, 0, v7)
	end
	local v8 = v7 - 1
	return {
		["colCount"] = v7,
		["gutterCount"] = math.max(0, v8)
	}
end
return function(p10, p11, p12, p13) -- name: getGridMetrics
	-- upvalues: (copy) v_u_9, (copy) v_u_3
	local v14 = v_u_9(p10, p11)
	local v15
	if p13 then
		v15 = v_u_9(p10, p11, p13)
	else
		v15 = v14
	end
	local v16 = p10.grid
	local v17 = v16.gaps[p11]
	local v18 = v16.gutters[p11]
	local v19 = v16.margins[p11]
	local v20 = p12 - v19 * 2
	local v21 = math.max(0, v20)
	local v22 = v14.gutterCount * v18
	local v23 = v15.gutterCount * v18
	local v24 = (v21 - v22) / v14.colCount
	local v25 = math.max(0, v24)
	local v26
	if v22 < v21 then
		local v27 = v25 * v15.colCount + v23
		v26 = math.floor(v27)
	else
		v26 = 0
	end
	local v28 = UDim2.fromOffset(v26, 0)
	return v_u_3.assign({
		["full"] = v_u_3.assign(v14, {
			["margin"] = v19
		}),
		["margin"] = v19,
		["colWidth"] = v25,
		["gapHeight"] = v17,
		["gutterWidth"] = v18,
		["gridWidth"] = v21,
		["cellSize"] = v28,
		["cellWidth"] = v26
	}, v15)
end