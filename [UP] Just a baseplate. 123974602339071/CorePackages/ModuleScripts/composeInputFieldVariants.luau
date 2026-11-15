-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InputField.composeInputFieldVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Enums.InputSize)
local v_u_2 = require(v1.Enums.InputVariant)
require(v1.Enums.Radius)
local v_u_3 = require(v1.Utility.composeStyleVariant)
local v_u_4 = require(script.Parent.getInputVariantsFactory)
require(v1.Providers.Style.Tokens)
return function(p5, p6, p7, p8, p9, p10, p11) -- name: composeInputFieldVariants
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	local v12 = v_u_4(p5)
	local v13 = v12.variants[p7 or v_u_2.Standard]
	local v14 = v_u_3
	local v15 = v12.common
	local v16 = v12.sizes[p6]
	local v17 = p7 == v_u_2.Utility and {} or v13
	local v18
	if p8 then
		v18 = v12.radius[p8]
	else
		v18 = v12.defaultRadius[p6]
	end
	return v14(v15, v16, v17, v18, p10 == nil and {} or v12.hoverState[p10], p9 == nil and {} or v12.focusedState[p9], p11 == nil and {} or v12.errorState[p11], p7 ~= v_u_2.Utility and {} or v13)
end