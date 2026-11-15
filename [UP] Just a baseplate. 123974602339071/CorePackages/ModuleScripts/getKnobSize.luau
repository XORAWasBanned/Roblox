-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Knob.getKnobSize
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.InputSize)
require(v1.Providers.Style.Tokens)
return function(p3, p4) -- name: getKnobSize
	-- upvalues: (copy) v_u_2
	local v5 = ({
		[v_u_2.XSmall] = p3.Size.Size_300,
		[v_u_2.Small] = p3.Size.Size_400,
		[v_u_2.Medium] = p3.Size.Size_500,
		[v_u_2.Large] = p3.Size.Size_600
	})[p4]
	return UDim2.fromOffset(v5, v5)
end