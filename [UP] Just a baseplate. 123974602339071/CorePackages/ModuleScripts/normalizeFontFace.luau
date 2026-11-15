-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.normalizeFontFace
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.ReactIs)
require(v1.Components.Types)
return function(p4) -- name: normalizeFontFace
	-- upvalues: (copy) v_u_3
	if typeof(p4) == "table" then
		if v_u_3.isBinding(p4) then
			return p4
		else
			return Font.new(p4.Family, p4.Weight, p4.Style)
		end
	elseif typeof(p4) == "EnumItem" then
		if p4 == Enum.Font.Unknown then
			return nil
		else
			return Font.fromEnum(p4)
		end
	else
		return p4
	end
end