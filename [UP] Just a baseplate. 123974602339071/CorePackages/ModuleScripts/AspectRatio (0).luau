-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.AspectRatio.AspectRatio
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactIs)
local v_u_5 = require(v1.Utility.getTestIdTag)
require(v1.Components.Types)
local function v_u_7(p6) -- name: getAspectRatio
	-- upvalues: (copy) v_u_4
	return (v_u_4.isBinding(p6) or typeof(p6) == "number") and {
		["AspectRatio"] = nil,
		["AspectType"] = nil,
		["DominantAxis"] = nil,
		["AspectRatio"] = p6
	} or {
		["AspectRatio"] = p6.AspectRatio,
		["AspectType"] = p6.AspectType,
		["DominantAxis"] = p6.DominantAxis
	}
end
return v_u_3.memo(function(p8) -- name: AspectRatio
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_5
	local v9 = v_u_7(p8.value)
	return v_u_3.createElement("UIAspectRatioConstraint", {
		["AspectRatio"] = v9.AspectRatio,
		["AspectType"] = v9.AspectType,
		["DominantAxis"] = v9.DominantAxis,
		[v_u_3.Tag] = v_u_5(p8.testId)
	})
end)