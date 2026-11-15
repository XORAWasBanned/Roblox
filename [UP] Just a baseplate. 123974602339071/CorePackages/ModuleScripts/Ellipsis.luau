-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.Nav.Ellipsis
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Text)
local v_u_5 = require(v1.Components.View)
require(v1.Enums.PaginationSize)
local v6 = script.Parent.Parent
local v_u_7 = require(v6.paginationUtils)
return v_u_3.memo(function(p8) -- name: Ellipsis
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_4
	local v9 = v_u_3.createElement
	local v10 = v_u_5
	local v11 = {
		["LayoutOrder"] = p8.LayoutOrder,
		["tag"] = v_u_7.getCircularSlotTag(p8.slotSize),
		["testId"] = p8.testId
	}
	local v12 = {
		["Text"] = v_u_3.createElement(v_u_4, {
			["Text"] = "...",
			["tag"] = nil,
			["LayoutOrder"] = 1,
			["tag"] = v_u_7.getPageLabelTag(p8.slotSize)
		})
	}
	return v9(v10, v11, v12)
end)