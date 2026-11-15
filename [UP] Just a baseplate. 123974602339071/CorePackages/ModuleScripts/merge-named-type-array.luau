-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.merge-named-type-array
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Boolean
local v5 = {}
require(v1.GraphQL)
require(script.Parent["merge-typedefs_types"])
local v_u_6 = require(v1.Utils).compareNodes
function v5.mergeNamedTypeArray(p7, p8, p9) -- name: mergeNamedTypeArray
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_6
	local v10 = p7 == nil and {} or p7
	local v_u_11 = p8 == nil and {} or p8
	local v12 = p9 == nil and {} or p9
	local v16 = v_u_3.concat({}, v_u_11, v_u_3.filter(v10, function(p_u_13)
		-- upvalues: (ref) v_u_4, (copy) v_u_11, (ref) v_u_3
		local v14 = v_u_11
		return not v_u_4.toJSBoolean(v_u_4.toJSBoolean(v_u_3.find(v14, function(p15)
			-- upvalues: (copy) p_u_13
			return p15.name.value == p_u_13.name.value
		end)) and true or false)
	end))
	if v12 and v_u_4.toJSBoolean(v12.sort) then
		v_u_3.sort(v16, v_u_6)
	end
	return v16
end
return v5