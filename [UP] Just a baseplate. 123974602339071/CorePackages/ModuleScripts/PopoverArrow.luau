-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.PopoverArrow
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
local v_u_4 = require(v1.Components.View)
return function(p5) -- name: PopoverArrow
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return v_u_3.createElement(v_u_4, {
		["Size"] = nil,
		["Position"] = nil,
		["Rotation"] = 45,
		["ZIndex"] = nil,
		["backgroundStyle"] = nil,
		["tag"] = "anchor-center-center",
		["testId"] = nil,
		["Size"] = UDim2.fromOffset(p5.size, p5.size),
		["Position"] = p5.position,
		["ZIndex"] = p5.ZIndex,
		["backgroundStyle"] = p5.backgroundStyle,
		["testId"] = p5.testId
	})
end