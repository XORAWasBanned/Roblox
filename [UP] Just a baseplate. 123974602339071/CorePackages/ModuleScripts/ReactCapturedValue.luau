-- Path: CorePackages.Packages._Index.ReactReconciler.ReactReconciler.ReactCapturedValue
require(script.Parent.ReactInternalTypes)
local v_u_1 = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd
return {
	["createCapturedValue"] = function(p2, p3)
		-- upvalues: (copy) v_u_1
		return {
			["value"] = p2,
			["source"] = p3,
			["stack"] = v_u_1(p3)
		}
	end
}