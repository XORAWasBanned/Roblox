-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.getOperationAST
require(script.Parent.Parent.language.ast)
local v_u_1 = require(script.Parent.Parent.language.kinds).Kind
return {
	["getOperationAST"] = function(p2, p3) -- name: getOperationAST
		-- upvalues: (copy) v_u_1
		local v4 = nil
		for _, v5 in pairs(p2.definitions) do
			if v5.kind ~= v_u_1.OPERATION_DEFINITION then
				continue
			end
			if p3 ~= nil then
				if not v5.name or v5.name.value ~= p3 then
					continue
				end
				return v5
			end
			if v4 then
				return nil
			end
			v4 = v5
		end
		return v4
	end
}