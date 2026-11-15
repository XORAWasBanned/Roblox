-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getFormattedTags
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Flags)
require(v1.Components.Types)
local v_u_3 = require(v1.Utility.devAssert)
return function(p4) -- name: getFormattedTags
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if p4 ~= nil then
		if typeof(p4) == "table" then
			local v5 = {}
			for v6, v7 in p4 do
				if not v7 then
					continue
				end
				table.insert(v5, v6)
			end
			return table.concat(v5, " ")
		end
		if typeof(p4) == "string" then
			return p4
		end
		if v_u_2.FoundationDevOnlyPropAsserts then
			v_u_3(false, "Invalid argument to useStyleTags. Expected a table or string, got " .. typeof(p4))
		else
			local v8 = "Invalid argument to useStyleTags. Expected a table or string, got " .. typeof(p4)
			assert(false, v8)
		end
	end
	return nil
end