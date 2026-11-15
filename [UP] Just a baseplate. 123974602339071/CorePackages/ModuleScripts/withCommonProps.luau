-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.withCommonProps
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
return function(p2, p3) -- name: withCommonProps
	if type(p3) == "table" then
		p3.AnchorPoint = p2.AnchorPoint
		p3.LayoutOrder = p2.LayoutOrder
		p3.Position = p2.Position
		p3.Visible = p2.Visible
		p3.ZIndex = p2.ZIndex
		p3.onAbsoluteSizeChanged = p2.onAbsoluteSizeChanged
		p3.onAbsolutePositionChanged = p2.onAbsolutePositionChanged
		p3.testId = p2.testId
	end
	return p3
end