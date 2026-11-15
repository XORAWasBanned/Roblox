-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Grid.Cell.GridCell
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
require(v1.Components.Types)
local v_u_5 = require(v1.Components.View)
local v_u_6 = require(v1.Utility.getGridSizeTag)
local v_u_7 = require(v1.Utility.withDefaults)
local v_u_8 = {
	["size"] = 1,
	["testId"] = "--foundation-grid--cell"
}
return v_u_4.memo(v_u_4.forwardRef(function(p9, p10) -- name: GridCell
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
	local v_u_11 = v_u_7(p9, v_u_8)
	local v12 = v_u_3.omit(v_u_11, { "size" })
	local v13 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_11
		return v_u_6(v_u_11.size)
	end, { v_u_11.size })
	return v_u_4.createElement(v_u_5, v_u_3.assign(v12, {
		["tag"] = table.concat({ v13, v_u_11.tag }, " "),
		["ref"] = p10
	}), v_u_11.children)
end))