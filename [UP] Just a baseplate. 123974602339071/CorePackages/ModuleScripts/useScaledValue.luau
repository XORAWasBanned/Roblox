-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useScaledValue
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Logger)
local v_u_3 = require(v1.Providers.Style.useTokens)
return function(p4) -- name: useScaledValue
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v5 = v_u_3()
	local v6 = p4 * v5.Config.UI.Scale
	if v6 <= v5.Size.Size_3000 then
		v_u_2:warning("useScaledValue should be used for values larger than Size tokens. For smaller values, please align to a Size or derivative token.")
	end
	return v6
end