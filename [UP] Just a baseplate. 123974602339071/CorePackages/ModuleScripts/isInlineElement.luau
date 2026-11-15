-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Utils.isInlineElement
local v1 = script:FindFirstAncestor("Utils").Parent
local v_u_2 = require(v1.Components.InlineLayout.InlineLayoutElements.HardBreakElement)
local v_u_3 = require(v1.Utils.InlineElementType)
return function(p4) -- name: isInlineElement
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if p4 == v_u_2 then
		return true
	end
	if type(p4) ~= "table" then
		return false
	end
	local v5 = getmetatable(p4)
	local v6
	if v5 == nil then
		v6 = false
	else
		v6 = v5.__type == v_u_3
	end
	return v6
end