-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getBuilderIconVariant.getBuilderIconVariant
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.BuilderIcons)
local v_u_4 = require(v1.Utility.isBuilderIcon)
return function(p_u_5) -- name: getBuilderIconVariant
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	if pcall(function()
		-- upvalues: (copy) p_u_5
		return p_u_5.Text
	end) then
		if v_u_4(p_u_5.Text) then
			if p_u_5.FontFace.Weight == Enum.FontWeight.Bold then
				return v_u_3.IconVariant.Filled
			else
				return v_u_3.IconVariant.Regular
			end
		else
			return nil
		end
	else
		return nil
	end
end