-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.KeyLabel.getVisualForKey
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Wrappers).Services.UserInputService
local v_u_3 = {}
return function(p4)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if v_u_3[p4] then
		return v_u_3[p4]
	end
	local v5 = v_u_2:GetImageForKeyCode(p4)
	if v5 and v5 ~= "" then
		return {
			["keyVisualType"] = "Image",
			["size"] = nil,
			["key"] = nil,
			["size"] = UDim2.fromScale(0.7, 0.7),
			["key"] = v5
		}
	end
	local v6 = v_u_2:GetStringForKeyCode(p4)
	local v7 = {
		["keyVisualType"] = "String",
		["size"] = nil,
		["key"] = nil,
		["size"] = UDim2.fromScale(0.8, 0.8),
		["key"] = v6 or ""
	}
	v_u_3[p4] = v7
	return v7
end