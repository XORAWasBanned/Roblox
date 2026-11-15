-- Path: CorePackages.Packages._Index.FoundationImages.FoundationImages.getResolutionScale
local v1 = game:GetService("GuiService")
local v2 = v1.GetResolutionScale
local v3, v4 = pcall(v2, v1)
local v5 = script.Parent
local v_u_6 = require(v5.Generated.GetImageSetData)
local v_u_7 = v1:IsTenFootInterface() and 3 or (not v3 and 1 or v4)
return function() -- name: getResolutionScale
	-- upvalues: (copy) v_u_6, (ref) v_u_7
	local _, v8 = v_u_6(v_u_7)
	return v8
end