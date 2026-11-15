-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.Pagination
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Enums.PaginationVariant)
local v_u_5 = require(v1.Utility.withDefaults)
local v_u_6 = require(script.Parent.Variants.DirectionalPagination)
local v_u_7 = require(script.Parent.Variants.MultiPagePagination)
local v_u_8 = {
	["variant"] = nil,
	["testId"] = "--foundation-pagination",
	["variant"] = v_u_4.MultiPage
}
return v_u_3.memo(v_u_3.forwardRef(function(p9, p10) -- name: Pagination
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_4, (copy) v_u_3, (copy) v_u_7, (copy) v_u_6
	local v11 = v_u_5(p9, v_u_8)
	v11.ref = p10
	if v11.variant == v_u_4.MultiPage then
		return v_u_3.createElement(v_u_7, v11)
	else
		return v_u_3.createElement(v_u_6, v11)
	end
end))