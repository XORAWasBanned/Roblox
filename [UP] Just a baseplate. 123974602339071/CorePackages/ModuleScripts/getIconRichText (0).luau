-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getIconRichText.getIconRichText
local v1 = script:FindFirstAncestor("Foundation").Parent
local v2 = require(v1.BuilderIcons)
local v_u_3 = v2.Font
local v_u_4 = v2.IconVariant
return function(p5, p6) -- name: getIconRichText
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v7 = v_u_3[p6 or v_u_4.Regular]
	return ("<font family=\"%*\" weight=\"%*\">%*</font>"):format(v7.Family, v7.Weight.Value, p5)
end