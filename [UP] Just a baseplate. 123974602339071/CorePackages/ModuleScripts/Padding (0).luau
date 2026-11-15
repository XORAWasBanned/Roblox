-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Padding.Padding
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactIs)
local v_u_5 = require(v1.Utility.getTestIdTag)
require(v1.Components.Types)
local function v_u_7(p6) -- name: getPadding
	-- upvalues: (copy) v_u_4
	return v_u_4.isBinding(p6) and {
		["PaddingTop"] = p6,
		["PaddingBottom"] = p6,
		["PaddingLeft"] = p6,
		["PaddingRight"] = p6
	} or (typeof(p6) == "table" and {
		["PaddingTop"] = p6.top,
		["PaddingBottom"] = p6.bottom,
		["PaddingLeft"] = p6.left,
		["PaddingRight"] = p6.right
	} or (typeof(p6) == "number" and {
		["PaddingTop"] = UDim.new(0, p6),
		["PaddingBottom"] = UDim.new(0, p6),
		["PaddingLeft"] = UDim.new(0, p6),
		["PaddingRight"] = UDim.new(0, p6)
	} or (typeof(p6) == "Vector2" and {
		["PaddingTop"] = UDim.new(0, p6.Y),
		["PaddingBottom"] = UDim.new(0, p6.Y),
		["PaddingLeft"] = UDim.new(0, p6.X),
		["PaddingRight"] = UDim.new(0, p6.X)
	} or (typeof(p6) == "UDim" and {
		["PaddingTop"] = p6,
		["PaddingBottom"] = p6,
		["PaddingLeft"] = p6,
		["PaddingRight"] = p6
	} or (typeof(p6) == "UDim2" and {
		["PaddingTop"] = p6.Y,
		["PaddingBottom"] = p6.Y,
		["PaddingLeft"] = p6.X,
		["PaddingRight"] = p6.X
	} or {})))))
end
return v_u_3.memo(function(p8) -- name: Padding
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_5
	local v9 = v_u_7(p8.value)
	return v_u_3.createElement("UIPadding", {
		["PaddingTop"] = v9.PaddingTop,
		["PaddingBottom"] = v9.PaddingBottom,
		["PaddingLeft"] = v9.PaddingLeft,
		["PaddingRight"] = v9.PaddingRight,
		[v_u_3.Tag] = v_u_5(p8.testId)
	})
end)