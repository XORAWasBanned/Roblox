-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Grid.createGridStyleRules
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v1.Enums.Breakpoint)
require(v1.Enums.BreakpointShortName)
local v_u_3 = require(v2.React)
require(v1.Providers.Responsive.ResponsiveContext)
local v_u_4 = require(v1.StyleSheet.StyleRule)
local function v_u_11(p5, p6) -- name: createGridStyleRule
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v7
	if p6 then
		v7 = (".%*-col-%*"):format(p6, p5)
	else
		v7 = (".col-%*"):format(p5)
	end
	local v8 = v_u_3.createElement
	local v9 = v_u_4
	local v10 = {
		["Selector"] = ("%* ::UISizeConstraint"):format(v7),
		["properties"] = {
			["MinSize"] = ("$ColMin%*"):format(p5),
			["MaxSize"] = ("$ColMax%*"):format(p5)
		}
	}
	return v8(v9, v10)
end
return function(p12) -- name: createGridStyleRules
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_4
	local v13 = p12.breakpoint
	local v14 = p12.grid
	local v15 = v13.order[#v13.order]
	local v16 = {}
	local v17 = {}
	for v18 = 0, v14.columns[v15] do
		v16[("Col%*"):format(v18)] = v_u_11(v18)
		if v18 ~= 0 then
			continue
		end
		v16.ColVisible0 = v_u_3.createElement(v_u_4, {
			["Selector"] = ".col-0",
			["properties"] = nil,
			["properties"] = {
				["Visible"] = false
			}
		})
	end
	for _, v19 in v13.order do
		local v20 = v13.shortNames[v19]
		local v21 = {}
		for v22 = 0, v14.columns[v19] do
			v21[("%*Col%*"):format(v19, v22)] = v_u_11(v22, v20)
			if v22 ~= 0 then
				continue
			end
			v21[("%*ColVisible0"):format(v19)] = v_u_3.createElement(v_u_4, {
				["Selector"] = (".%*-col-0"):format(v20),
				["properties"] = {
					["Visible"] = false
				}
			})
		end
		v17[v19] = v21
	end
	return {
		["baseRules"] = v16,
		["rulesByBreakpoint"] = v17
	}
end