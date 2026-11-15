-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Utils.renderInMeasuredFrame
local v1 = script:FindFirstAncestor("Utils").Parent.Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(v1.MarkdownCore).Flags
return function(p4, p5, p6) -- name: renderInMeasuredFrame
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return v_u_2.createElement("Frame", {
		["key"] = nil,
		["LayoutOrder"] = nil,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["key"] = tostring(p6),
		["LayoutOrder"] = p6,
		["Size"] = UDim2.fromOffset(p5, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}, not (v_u_3.FFlagMarkdownTables or v_u_3.FFlagMarkdownTagFallbacks) and {
		["Element"] = p4
	} or p4)
end