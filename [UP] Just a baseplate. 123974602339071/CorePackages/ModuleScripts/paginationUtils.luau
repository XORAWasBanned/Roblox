-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.paginationUtils
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Enums.PaginationSize)
require(v1.Providers.Style.Tokens)
local v_u_3 = {
	[v2.Small] = "row align-x-center align-y-center radius-circle size-600-600",
	[v2.Medium] = "row align-x-center align-y-center radius-circle size-800-800"
}
local v_u_4 = {
	[v2.Small] = "text-label-small",
	[v2.Medium] = "text-label-medium"
}
return {
	["getCircularSlotTag"] = function(p5) -- name: getCircularSlotTag
		-- upvalues: (copy) v_u_3
		return v_u_3[p5]
	end,
	["getPageLabelTag"] = function(p6) -- name: getPageLabelTag
		-- upvalues: (copy) v_u_4
		return ("auto-xy %* content-default text-align-x-center text-align-y-center"):format(v_u_4[p6])
	end,
	["getPageLabelTextTag"] = function(p7) -- name: getPageLabelTextTag
		-- upvalues: (copy) v_u_4
		return ("auto-xy %* text-align-x-center text-align-y-center"):format(v_u_4[p7])
	end,
	["getSlotCursor"] = function(p8) -- name: getSlotCursor
		local v9 = p8.Stroke.Thicker
		local v10 = math.floor(v9)
		return {
			["radius"] = UDim.new(0, p8.Radius.Circle),
			["offset"] = p8.Size.Size_150,
			["borderWidth"] = v10
		}
	end,
	["needsWidePageSlot"] = function(p11) -- name: needsWidePageSlot
		return p11 > 999
	end
}