-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.arguments
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Boolean
local v5 = {}
require(v1.GraphQL)
require(script.Parent["merge-typedefs_types"])
local v6 = require(v1.Utils)
local v_u_7 = v6.compareNodes
local v_u_8 = v6.isSome
local v_u_9 = nil
function v5.mergeArguments(p10, p11, p12) -- name: mergeArguments
	-- upvalues: (ref) v_u_9, (copy) v_u_3, (copy) v_u_8, (copy) v_u_7
	local v13 = v_u_9(v_u_3.filter(v_u_3.concat({}, p11, p10), v_u_8))
	if p12 and p12.sort then
		v_u_3.sort(v13, v_u_7)
	end
	return v13
end
v_u_9 = function(p14) -- name: deduplicateArguments
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return v_u_3.reduce(p14, function(p15, p_u_16)
		-- upvalues: (ref) v_u_3, (ref) v_u_4
		local v18 = v_u_3.find(p15, function(p17)
			-- upvalues: (copy) p_u_16
			return p17.name.value == p_u_16.name.value
		end)
		if v_u_4.toJSBoolean(v18) then
			return p15
		else
			return v_u_3.concat(p15, { p_u_16 })
		end
	end, {})
end
return v5